import 'package:flutter/material.dart';
import 'package:add_to_cart/core/style/app_style.dart';
import 'package:add_to_cart/features/meals/domain/entities/meal_option.dart';
import 'package:add_to_cart/features/meals/domain/entities/option_value.dart';
import 'package:add_to_cart/gen/assets.gen.dart';

class AddToCartOptionsList extends StatelessWidget {
  final List<MealOption> options;
  final Map<String, List<OptionValue>> selectedOptions;
  final Function(String optionId, OptionValue value, bool isMultiSelect) onOptionSelected;

  const AddToCartOptionsList({
    super.key,
    required this.options,
    required this.selectedOptions,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: options.map((option) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      option.name,
                      style: const TextStyle(
                        color: AppColors.ink,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (option.isRequired)
                      const Text(
                        '(required)',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ],
                ),
              ),
              ...option.values.map((val) {
                final isSelected = selectedOptions[option.id]?.any((v) => v.id == val.id) ?? false;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: AppColors.canvas,
                    borderRadius: AppRadii.field,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.line,
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                  child: InkWell(
                    onTap: () => onOptionSelected(option.id, val, !option.isSingle),
                    borderRadius: AppRadii.field,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            val.name,
                            style: TextStyle(
                              color: isSelected ? AppColors.primary : AppColors.ink,
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          Row(
                            children: [
                              if (val.price > 0)
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text(
                                    formatMoney(val.price),
                                    style: const TextStyle(
                                      color: AppColors.muted,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              option.isSingle
                                  ? (isSelected
                                      ? SizedBox(
                                          width: 22,
                                          height: 22,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Assets.images.radioButton.svg(width: 22, height: 22),
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Assets.images.radioButton.svg(width: 22, height: 22))
                                  : (isSelected
                                      ? SizedBox(
                                          width: 22,
                                          height: 22,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Assets.images.checkBox.svg(width: 22, height: 22),
                                              Assets.images.checkIcon.svg(
                                                width: 12,
                                                height: 12,
                                                colorFilter: const ColorFilter.mode(
                                                  AppColors.primary,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Assets.images.checkBox.svg(width: 22, height: 22)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        }).toList(),
      ),
    );
  }
}
