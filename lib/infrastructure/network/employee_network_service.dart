import 'package:dio/dio.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/dto/employee_dto.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/payload/employee_payload.dart';
import 'package:flutter_wonderwoman_projectscoid/infrastructure/network/provider/network_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'employee_network_service.g.dart';

final employeeNetworkServiceProvider =
    Provider((ref) => EmployeeNetworkService(ref.read));

@RestApi()
abstract class EmployeeNetworkService {
  factory EmployeeNetworkService(Reader reader) =>
      _EmployeeNetworkService(reader(networkClientProvider));

  @GET('/employee/list?branch_id=%25&department_id=%25')
  Future<EmployeeDTO> list();

  @GET('/employee/get?employee_id={id}')
  Future<EmployeeDetailDTO> get(@Path("id") int employeeID);

  @POST('/employee/add')
  Future<String> add(@Body() EmployeePayload payload);

  @POST('/employee/edit') // should patch
  Future<String> edit(@Body() EmployeePayload payload);

  @POST('/employee/delete') // should delete
  Future<String> delete(@Body() EmployeePayload payload);

// curl --location 'https://bowindo.servehttp.com/employee/add' \
// --header 'token;' \
// --data-raw '{
//     "employee_name": "Bowindo Employe #001",
//     "employee_address": "Metaverse SAND#9098812399",
//     "employee_mail": "bowindo@metaverse.dummy",
//     "employee_dob": "2023-07-01",
//     "department_id": 1,
//     "branch_id": "001"
// }'

// curl --location 'https://bowindo.servehttp.com/employee/edit' \
// --header 'token;' \
// --data-raw '{
//     "employee_id": 2,
//     "employee_name": "Bowindo Employe #002_Edited",
//     "employee_address": "GalaVerse SAND#9098812399",
//     "employee_mail": "bowindo@metaverse.dummy",
//     "employee_dob": "2023-07-05",
//     "department_id": 3,
//     "branch_id": "001"
// }'
// curl --location 'https://bowindo.servehttp.com/employee/delete' \
// --header 'token;' \
// --data '{
//     "employee_id": 3
// }'
}
