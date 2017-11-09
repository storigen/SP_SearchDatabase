# SP_SearchDatabase
Search database for stored procedures, columns and tables containing some string

### Description 
Pass some string into the sproc an it will return any objects and parent objects that contain that string. For example, if you search for "clientid" this will return any columns and their corresponding table that uses clientid, as well as any stored procedures that use those columns.
