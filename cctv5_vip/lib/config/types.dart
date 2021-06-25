enum LaunchPageType { Default, First }

enum EnvType { Default, T100, P100, P200 }

typedef PagePopResult<T> = void Function(T value);
