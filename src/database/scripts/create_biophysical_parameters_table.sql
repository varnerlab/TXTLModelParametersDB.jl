CREATE TABLE  (
    biophysical_parameter_id PRIMARY KEY NOT NULL,
    parameter_key VARCHAR(255) NOT NULL,
    parameter_value VARCHAR(255) NOT NULL,
    parameter_units VARCHAR(255) NOT NULL,
    parameter_source_reference VARCHAR(255) DEFAULT NULL,
    system_key VARCHAR(255) NOT NULL
);