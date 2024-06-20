class Module {
   final int moduleId; 
   final String moduleName;
   final String moduleDescription; 
   final String createdDate;

  Module({
    required this.moduleId, 
    required this.moduleName, 
    required this.moduleDescription, 
    required this.createdDate
  });

  factory Module.fromJson(Map<String, dynamic> json){
    return Module(
      moduleId: json['moduleId'] ?? 0, 
      moduleName: json['moduleName'] ?? '', 
      moduleDescription: json['moduleDescription'] ?? '', 
      createdDate: json['createdDate'] ?? ''
    );
  }
}