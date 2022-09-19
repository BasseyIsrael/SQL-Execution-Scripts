--This is a script to create a simple demo database on postgres 

CREATE SCHEMA demo_data
    AUTHORIZATION postgres;

COMMENT ON SCHEMA public
    IS 'demo_data schema for testing out data validation scripts';

GRANT ALL ON SCHEMA demo_data TO PUBLIC;

GRANT ALL ON SCHEMA demo_data TO postgres;
