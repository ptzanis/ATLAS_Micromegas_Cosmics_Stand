--System Configuration DB Update patch v2.0.7
-- Changes w.r.t. v 2.0.7
-- 1.- Add field to the fw_sys_stat_proj_comps in order to allow users to define whether the project has to be restarted after the installation of components:

--Update schema version
CREATE OR REPLACE VIEW fw_sys_stat_schema (version) AS
	SELECT '2.0.7'
	FROM dual;

ALTER TABLE FW_SYS_STAT_PROJECT_GROUPS
ADD(RESTART_PROJECT NUMBER DEFAULT 1);

CREATE OR REPLACE VIEW fw_sys_stat_proj_comps AS
	SELECT HOSTNAME, PROJECT_NAME, COMPONENT_NAME, MAX(COMPONENT_VERSION) COMPONENT_VERSION, IS_SUBCOMPONENT, DEFAULT_PATH, IS_OFFICIAL, IS_PATCH, DESCRIPTION_FILE, OVERWRITE_FILES, FORCE_REQUIRED, IS_SILENT, MAX(VALID_FROM) as M_VALID_FROM, RESTART_PROJECT
	FROM (SELECT PC.HOSTNAME, P.PROJECT_NAME, C.COMPONENT_NAME, C.COMPONENT_VERSION, C.IS_SUBCOMPONENT, C.DEFAULT_PATH, C.IS_OFFICIAL, C.IS_PATCH, GC.DESCRIPTION_FILE, PG.OVERWRITE_FILES, PG.FORCE_REQUIRED, PG.IS_SILENT, GC.VALID_FROM, PG.RESTART_PROJECT
			FROM FW_SYS_STAT_PVSS_PROJECT P, FW_SYS_STAT_GROUP_OF_COMP G, FW_SYS_STAT_PROJECT_GROUPS PG, FW_SYS_STAT_COMP_IN_GROUPS GC, FW_SYS_STAT_COMPONENT C, FW_SYS_STAT_COMPUTER PC
			WHERE P.ID = PG.PROJECT_ID AND PG.VALID_UNTIL IS NULL AND P.VALID_UNTIL IS NULL AND G.ID = PG.GROUP_ID AND GC.GROUP_ID = G.ID AND GC.VALID_UNTIL IS NULL AND C.ID = GC.FW_COMPONENT_ID AND C.VALID_UNTIL IS NULL AND PC.ID = P.COMPUTER_ID AND PC.VALID_UNTIL IS NULL)
	GROUP BY COMPONENT_NAME, HOSTNAME, PROJECT_NAME, COMPONENT_NAME, IS_SUBCOMPONENT, DEFAULT_PATH, IS_OFFICIAL, IS_PATCH, DESCRIPTION_FILE, OVERWRITE_FILES, FORCE_REQUIRED, IS_SILENT, RESTART_PROJECT
	ORDER BY M_VALID_FROM;

ALTER TABLE FW_SYS_STAT_INST_PATH DROP CONSTRAINT PROJECT_PATH_UQ;
ALTER TABLE FW_SYS_STAT_PVSS_PROJECT ADD (IS_DIST_PEERS_OK NUMBER);

