import 'package:get_it/get_it.dart';
import 'package:add_to_cart/features/meals/data/datasources/meals_local_data_source.dart';
import 'package:add_to_cart/features/meals/data/repositories/meals_repository_impl.dart';
import 'package:add_to_cart/features/meals/domain/repositories/meals_repository.dart';
import 'package:add_to_cart/features/cart/domain/repositories/cart_repository.dart';
import 'package:add_to_cart/features/cart/domain/repositories/cart_repository_impl.dart';
import 'package:add_to_cart/features/cart/domain/services/cart_pricing_service.dart';
import 'package:add_to_cart/features/meals/presentation/providers/meals_provider.dart';
import 'package:add_to_cart/features/cart/presentation/providers/cart_provider.dart';

final getIt  = GetIt.instance;

void configureDependencies() {

  getIt.registerLazySingleton<CartPricingService>(() => CartPricingService());

  getIt.registerLazySingleton<MealsLocalDataSource>(() => MealsLocalDataSourceImpl());

  getIt.registerLazySingleton<MealsRepository>(
    () => MealsRepositoryImpl(localDataSource: getIt ()),
  );

  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(pricingService: getIt ()),
  );

  getIt.registerFactory<MealsProvider>(
    () => MealsProvider(mealsRepository: getIt ()),
  );
  getIt.registerFactory<CartProvider>(
    () => CartProvider(cartRepository: getIt (), pricingService: getIt ()),
  );
}
