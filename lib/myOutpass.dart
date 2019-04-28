class myOutpass {
  String _id,outpassName,outpassDate,outpassDepartureTime,outpassInTime,outpassAddress;
  String status;

  myOutpass(this._id,this.outpassName,this.outpassDate,this.outpassDepartureTime,this.outpassInTime,this.outpassAddress,this.status);
  String get id => _id;
}

class myLeave{
  String name;
  String dateOfDeparture;
  String dateOfArrival;
  String departureTime;
  String inTime;
  String address;
  String reason;
  String status;


  myLeave(this.name,this.dateOfDeparture,this.dateOfArrival,this.departureTime,this.inTime,this.address,this.reason,this.status);
}

class myComplain{
  String complain_type,message;


  myComplain(this.complain_type,this.message);
}