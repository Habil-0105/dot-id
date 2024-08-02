import 'package:dot/features/expense/data/model/expense_model.dart';
import 'package:dot/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:dot/features/expense/presentation/pages/add/widgets/app_button.dart';
import 'package:dot/features/expense/presentation/pages/add/widgets/app_text_input.dart';
import 'package:dot/features/expense/presentation/pages/add/widgets/category_bottom_sheet.dart';
import 'package:dot/features/expense/presentation/pages/add/widgets/custom_toast.dart';
import 'package:dot/features/expense/presentation/pages/add/widgets/loading_button.dart';
import 'package:dot/injector.dart';
import 'package:dot/shared/extensions/date_time_extension.dart';
import 'package:dot/shared/extensions/num_extension.dart';
import 'package:dot/shared/extensions/string_extension.dart';
import 'package:dot/shared/utils/enums/category.dart';
import 'package:dot/themes/app_color.dart';
import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:uuid/uuid.dart';

class AddPage extends StatefulWidget{
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late TextEditingController _name;
  bool _isNameEmpty = true;

  late TextEditingController _category;
  Category _selectedCategory = Category.food;

  late TextEditingController _date;
  bool _isDateEmpty = true;
  DateTime? _currentDate;

  late TextEditingController _price;
  bool _isPriceEmpty = true;

  @override
  void initState() {
    _name = TextEditingController();
    _category = TextEditingController(text: _selectedCategory.name);
    _date = TextEditingController();
    _price = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: injector<ExpenseBloc>().state.status != ExpenseStatus.loading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            onTap: injector<ExpenseBloc>().state.status != ExpenseStatus.loading ? () => Navigator.pop(context) : null,
            child: Icon(Icons.chevron_left_rounded, size: 40.h, color: AppColor.grey[2],),
          ),
          title: Text(
            "Tambah Pengeluaran Baru",
            style: AppTypography.subHeading1.copyWith(color: AppColor.grey),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  Gap(20.h),
                  AppTextInput(
                    hintText: "Nama Pengeluaran",
                    controller: _name,
                    keyboardType: TextInputType.name,
                    onChanged: (val) => _nameOnChange(val),
                  ),
                  Gap(20.h),
                  AppTextInput(
                    hintText: "Kategori",
                    controller: _category,
                    readOnly: true,
                    prefixIcon: ImageIcon(
                      AssetImage(_selectedCategory.icon),
                      color: _selectedCategory.color,
                      size: 20.h,
                    ),
                    suffixIcon: Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.grey[5]
                      ),
                      child: Center(
                        child: Icon(Icons.chevron_right_rounded, color: AppColor.grey[3],),
                      ),
                    ),
                    onTap: () async => await _categoryOnTap(context),
                  ),
                  Gap(20.h),
                  AppTextInput(
                    hintText: "Tanggal Pengeluaran",
                    controller: _date,
                    readOnly: true,
                    suffixIcon: ImageIcon(
                      const AssetImage("assets/calendar.png"),
                      size: 22.h,
                      color: AppColor.grey[4],
                    ),
                    onTap: () async => await _dateOnTap(context),
                  ),
                  Gap(20.h),
                  AppTextInput(
                    hintText: "Nominal",
                    controller: _price,
                    keyboardType: TextInputType.number,
                    onChanged: (val) => _priceOnChange(val),
                  ),
                  Gap(32.h),
                  BlocConsumer<ExpenseBloc, ExpenseState>(
                    listener: (context, state){
                      if(state.status == ExpenseStatus.error){
                        CustomToast.customToast("Can't insert new expense");
                      }

                      if(state.status == ExpenseStatus.add){
                        injector<ExpenseBloc>().add(FetchExpenses());
                      }

                      if(state.status == ExpenseStatus.fetch){
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state){
                      if(state.status == ExpenseStatus.loading){
                        return const LoadingButton();
                      }

                      return AppButton(
                        text: "Simpan",
                        onPressed: (){
                          var uuid = const Uuid().v1();
                          var expense = ExpenseModel(
                              uuid: uuid,
                              name: _name.text,
                              category: _category.text,
                              date: _currentDate,
                              price: _price.text.toInt,
                              createdAt: DateTime.now()
                          );

                          injector<ExpenseBloc>().add(InsertExpense(expense: expense));
                        },
                        disabled: _isNameEmpty || _isDateEmpty || _isPriceEmpty,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _nameOnChange(String val){
    if (val.isEmpty) {
      setState(() {
        _isNameEmpty = true;
      });
    } else {
      if (_isNameEmpty) {
        setState(() {
          _isNameEmpty = false;
        });
      }
    }
  }

  Future<void> _categoryOnTap(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return CategoryBottomSheet(
            onTap: (category){
              setState(() {
                _selectedCategory = category;
              });
              _category.text = _selectedCategory.name;
              Navigator.pop(context);
            }
          );
        }
    );
  }

  Future<void> _dateOnTap(BuildContext context)async{
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        currentDate: _currentDate,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        locale: const Locale('id', ''),
        initialEntryMode: DatePickerEntryMode.calendarOnly
    );

    if(pickedDate != null){
      _currentDate = pickedDate;
      _date.text = _currentDate!.toUniqueDate;

      setState(() {
        _isDateEmpty = false;
      });
    }
  }

  void _priceOnChange(String val){
    if (val.isEmpty) {
      setState(() {
        _isPriceEmpty = true;
      });
    } else {
      int price = val.toInt;
      if(val != "0" && price != 0){
        _price.text = price.convertToIdr;
        if (_isPriceEmpty) {
          setState(() {
            _isPriceEmpty = false;
          });
        }
      }else{
        _price.text = "";
      }
    }
  }
}