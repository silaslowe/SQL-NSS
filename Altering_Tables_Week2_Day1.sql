-- Fork 1
CREATE TABLE VehicleBodyTypes (
      vehicle_body_type_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      name VARCHAR (20)
);
CREATE TABLE VehicleMakes (
      vehicle_make_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      name VARCHAR (20)
);
CREATE TABLE VehicleModels (
      vehicle_model_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      name VARCHAR (20)
);
-- + import csvs
-- Fork 2
ALTER TABLE vehicleTypes
RENAME COLUMN body_type TO body_type_id;
ALTER TABLE vehicleTypes
RENAME COLUMN make TO make_id;
ALTER TABLE vehicleTypes
RENAME COLUMN model TO model_id;
ALTER TABLE vehicleTypes
ALTER COLUMN body_type_id TYPE INT USING body_type_id::integer,
ALTER COLUMN make_id TYPE INT USING make_id::integer,
ALTER COLUMN model_id TYPE INT USING model_id::integer;
-- Merge those forks
ALTER TABLE vehicleTypes
ADD CONSTRAINT constraint_fk_vehicle_body_type
FOREIGN KEY (body_type_id)
REFERENCES VehicleBodyTypes(vehicle_body_type_id);
ALTER TABLE vehicleTypes
ADD CONSTRAINT constraint_fk_vehicle_make
FOREIGN KEY (make_id)
REFERENCES VehicleMakes(vehicle_make_id);
ALTER TABLE vehicleTypes
ADD CONSTRAINT constraint_fk_3
FOREIGN KEY (model_id)
REFERENCES VehicleModels(vehicle_model_id);