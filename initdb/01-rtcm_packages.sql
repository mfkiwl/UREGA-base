CREATE TABLE IF NOT EXISTS rtcm_packages (
    rtcm_package_id SERIAL,
    receive_time TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    mountpoint VARCHAR(50),
    rtcm_obs_epoch TIMESTAMP WITH TIME ZONE,
    rtcm_msg_type SMALLINT NOT NULL,
    rtcm_msg_size INTEGER,
    rtcm_sat_count SMALLINT
);

SELECT create_hypertable('rtcm_packages', 'receive_time', 'mountpoint', 2);
CREATE INDEX ON rtcm_packages(mountpoint, rtcm_msg_type, receive_time DESC);
CREATE INDEX ON rtcm_packages(mountpoint, rtcm_msg_type, receive_time, rtcm_obs_epoch DESC);
CREATE INDEX ON rtcm_packages(rtcm_package_id DESC);
