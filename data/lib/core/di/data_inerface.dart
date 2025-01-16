import 'data_layer_config.dart';

class DataInterfaceImpl implements DataInterface {
  static late DataInterface instance;

  @override
  void dispose() {
    dgi.reset();
    instance.dispose();
  }

  @override
  void init()  {
    instance = this;
    configureDataLayer();
  }

  @override
  T createRepository<T extends Object>() {
    return dgi.get<T>();
  }
}

abstract class DataInterface {
  const DataInterface();

  void init();

  T createRepository<T extends Object>();

  void dispose();
}
