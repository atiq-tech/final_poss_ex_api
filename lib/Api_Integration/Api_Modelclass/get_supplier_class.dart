class GetSupplierClass {
  String? _supplierSlNo;
  String? _supplierCode;
  String? _supplierName;
  String? _supplierType;
  String? _supplierPhone;
  String? _supplierMobile;
  String? _supplierEmail;
  String? _supplierOfficePhone;
  String? _supplierAddress;
  String? _contactPerson;
  String? _districtSlNo;
  String? _countrySlNo;
  String? _supplierWeb;
  String? _previousDue;
  String? _imageName;
  String? _status;
  String? _addBy;
  String? _addTime;
  String? _updateBy;
  String? _updateTime;
  String? _supplierBrinchid;
  String? _displayName;

  GetSupplierClass(
      {String? supplierSlNo,
      String? supplierCode,
      String? supplierName,
      String? supplierType,
      String? supplierPhone,
      String? supplierMobile,
      String? supplierEmail,
      String? supplierOfficePhone,
      String? supplierAddress,
      String? contactPerson,
      String? districtSlNo,
      String? countrySlNo,
      String? supplierWeb,
      String? previousDue,
      String? imageName,
      String? status,
      String? addBy,
      String? addTime,
      String? updateBy,
      String? updateTime,
      String? supplierBrinchid,
      String? displayName}) {
    if (supplierSlNo != null) {
      this._supplierSlNo = supplierSlNo;
    }
    if (supplierCode != null) {
      this._supplierCode = supplierCode;
    }
    if (supplierName != null) {
      this._supplierName = supplierName;
    }
    if (supplierType != null) {
      this._supplierType = supplierType;
    }
    if (supplierPhone != null) {
      this._supplierPhone = supplierPhone;
    }
    if (supplierMobile != null) {
      this._supplierMobile = supplierMobile;
    }
    if (supplierEmail != null) {
      this._supplierEmail = supplierEmail;
    }
    if (supplierOfficePhone != null) {
      this._supplierOfficePhone = supplierOfficePhone;
    }
    if (supplierAddress != null) {
      this._supplierAddress = supplierAddress;
    }
    if (contactPerson != null) {
      this._contactPerson = contactPerson;
    }
    if (districtSlNo != null) {
      this._districtSlNo = districtSlNo;
    }
    if (countrySlNo != null) {
      this._countrySlNo = countrySlNo;
    }
    if (supplierWeb != null) {
      this._supplierWeb = supplierWeb;
    }
    if (previousDue != null) {
      this._previousDue = previousDue;
    }
    if (imageName != null) {
      this._imageName = imageName;
    }
    if (status != null) {
      this._status = status;
    }
    if (addBy != null) {
      this._addBy = addBy;
    }
    if (addTime != null) {
      this._addTime = addTime;
    }
    if (updateBy != null) {
      this._updateBy = updateBy;
    }
    if (updateTime != null) {
      this._updateTime = updateTime;
    }
    if (supplierBrinchid != null) {
      this._supplierBrinchid = supplierBrinchid;
    }
    if (displayName != null) {
      this._displayName = displayName;
    }
  }

  String? get supplierSlNo => _supplierSlNo;
  set supplierSlNo(String? supplierSlNo) => _supplierSlNo = supplierSlNo;
  String? get supplierCode => _supplierCode;
  set supplierCode(String? supplierCode) => _supplierCode = supplierCode;
  String? get supplierName => _supplierName;
  set supplierName(String? supplierName) => _supplierName = supplierName;
  String? get supplierType => _supplierType;
  set supplierType(String? supplierType) => _supplierType = supplierType;
  String? get supplierPhone => _supplierPhone;
  set supplierPhone(String? supplierPhone) => _supplierPhone = supplierPhone;
  String? get supplierMobile => _supplierMobile;
  set supplierMobile(String? supplierMobile) =>
      _supplierMobile = supplierMobile;
  String? get supplierEmail => _supplierEmail;
  set supplierEmail(String? supplierEmail) => _supplierEmail = supplierEmail;
  String? get supplierOfficePhone => _supplierOfficePhone;
  set supplierOfficePhone(String? supplierOfficePhone) =>
      _supplierOfficePhone = supplierOfficePhone;
  String? get supplierAddress => _supplierAddress;
  set supplierAddress(String? supplierAddress) =>
      _supplierAddress = supplierAddress;
  String? get contactPerson => _contactPerson;
  set contactPerson(String? contactPerson) => _contactPerson = contactPerson;
  String? get districtSlNo => _districtSlNo;
  set districtSlNo(String? districtSlNo) => _districtSlNo = districtSlNo;
  String? get countrySlNo => _countrySlNo;
  set countrySlNo(String? countrySlNo) => _countrySlNo = countrySlNo;
  String? get supplierWeb => _supplierWeb;
  set supplierWeb(String? supplierWeb) => _supplierWeb = supplierWeb;
  String? get previousDue => _previousDue;
  set previousDue(String? previousDue) => _previousDue = previousDue;
  String? get imageName => _imageName;
  set imageName(String? imageName) => _imageName = imageName;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get addBy => _addBy;
  set addBy(String? addBy) => _addBy = addBy;
  String? get addTime => _addTime;
  set addTime(String? addTime) => _addTime = addTime;
  String? get updateBy => _updateBy;
  set updateBy(String? updateBy) => _updateBy = updateBy;
  String? get updateTime => _updateTime;
  set updateTime(String? updateTime) => _updateTime = updateTime;
  String? get supplierBrinchid => _supplierBrinchid;
  set supplierBrinchid(String? supplierBrinchid) =>
      _supplierBrinchid = supplierBrinchid;
  String? get displayName => _displayName;
  set displayName(String? displayName) => _displayName = displayName;

  GetSupplierClass.fromJson(Map<String, dynamic> json) {
    _supplierSlNo = json['Supplier_SlNo'];
    _supplierCode = json['Supplier_Code'];
    _supplierName = json['Supplier_Name'];
    _supplierType = json['Supplier_Type'];
    _supplierPhone = json['Supplier_Phone'];
    _supplierMobile = json['Supplier_Mobile'];
    _supplierEmail = json['Supplier_Email'];
    _supplierOfficePhone = json['Supplier_OfficePhone'];
    _supplierAddress = json['Supplier_Address'];
    _contactPerson = json['contact_person'];
    _districtSlNo = json['District_SlNo'];
    _countrySlNo = json['Country_SlNo'];
    _supplierWeb = json['Supplier_Web'];
    _previousDue = json['previous_due'];
    _imageName = json['image_name'];
    _status = json['Status'];
    _addBy = json['AddBy'];
    _addTime = json['AddTime'];
    _updateBy = json['UpdateBy'];
    _updateTime = json['UpdateTime'];
    _supplierBrinchid = json['Supplier_brinchid'];
    _displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Supplier_SlNo'] = this._supplierSlNo;
    data['Supplier_Code'] = this._supplierCode;
    data['Supplier_Name'] = this._supplierName;
    data['Supplier_Type'] = this._supplierType;
    data['Supplier_Phone'] = this._supplierPhone;
    data['Supplier_Mobile'] = this._supplierMobile;
    data['Supplier_Email'] = this._supplierEmail;
    data['Supplier_OfficePhone'] = this._supplierOfficePhone;
    data['Supplier_Address'] = this._supplierAddress;
    data['contact_person'] = this._contactPerson;
    data['District_SlNo'] = this._districtSlNo;
    data['Country_SlNo'] = this._countrySlNo;
    data['Supplier_Web'] = this._supplierWeb;
    data['previous_due'] = this._previousDue;
    data['image_name'] = this._imageName;
    data['Status'] = this._status;
    data['AddBy'] = this._addBy;
    data['AddTime'] = this._addTime;
    data['UpdateBy'] = this._updateBy;
    data['UpdateTime'] = this._updateTime;
    data['Supplier_brinchid'] = this._supplierBrinchid;
    data['display_name'] = this._displayName;
    return data;
  }
}
