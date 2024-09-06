abstract class Failure {
  final String message;

  Failure({required this.message});
}

class HiveFailure extends Failure {
  HiveFailure({required super.message});

  factory HiveFailure.fromHiveException(Object exception) {
    if (exception is HiveError) {
      return HiveFailure(message: _mapHiveErrorToMessage(exception));
    } else {
      return HiveFailure(message: 'Unknown error occurred with Hive');
    }
  }

  static String _mapHiveErrorToMessage(HiveError error) {
    switch (error.type) {
      case HiveErrorType.openBoxError:
        return 'Error opening Hive box';
      case HiveErrorType.readError:
        return 'Error reading from Hive box';
      case HiveErrorType.writeError:
        return 'Error writing to Hive box';
      case HiveErrorType.deleteError:
        return 'Error deleting from Hive box';
      case HiveErrorType.transactionError:
        return 'Error during Hive transaction';
      default:
        return 'An unexpected Hive error occurred';
    }
  }
}

enum HiveErrorType {
  openBoxError,
  readError,
  writeError,
  deleteError,
  transactionError,
}

class HiveError {
  final HiveErrorType type;

  HiveError(this.type);
}
