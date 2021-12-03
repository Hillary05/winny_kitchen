class UserModelReceipt {
  String? receipt;


  UserModelReceipt({this.receipt});

  // receeiving data from server
  factory UserModelReceipt.fromMap(map) {
    return UserModelReceipt(
      receipt: map['receipt'],
    );
  }

  // sending data to our server
  Map<String , dynamic> toMap() {
    return {
      'receipt': receipt,
    };
  }
}
