
LOG_CFG_lANG = "en"; 				/*  en = english , de = german , fr = french  */
LOG_CFG_ALLOW_LOCKED = false;	 	/* allow to transport locked vehicles */
LOG_CFG_ALLOW_CHAINING = false; 	/* allow chain towing  */
LOG_CFG_ALLOW_GETIN = false; 		/* allow player to get into a towed / lifted object  */
P2LOG_CFG_ALLOW_FROMPLOT = false; 	/* player2: allow player to tow or lift from plots */

/*--------------------------------------------------------------------------------------------------------------
	LIST OF VEHICLES WHERE CAN TOW
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_CANTOW=[
"2s6m_tunguska",
	"aav",
	"armoredsuv_pmc",
	"armoredsuv_pmc_dz",
	"armoredsuv_pmc_dze",
	"atv_cz_ep1",
	"atv_us_ep1",
	"av8b",
	"av8b2",
	"baf_atv_d",
	"baf_atv_w",
	"baf_fv510_d",
	"baf_fv510_w",
	"baf_jackal2_gmg_d",
	"baf_jackal2_gmg_w",
	"baf_jackal2_l2a1_d",
	"baf_jackal2_l2a1_w",
	"baf_offroad_d",
	"baf_offroad_w",
	"bmp2_ambul_cdf",
	"bmp2_ambul_ins",
	"bmp2_cdf",
	"bmp2_gue",
	"bmp2_hq_cdf",
	"bmp2_hq_ins",
	"bmp2_hq_tk_ep1",
	"bmp2_ins",
	"bmp2_tk_ep1",
	"bmp2_un_ep1",
	"bmp3",
	"brdm2_atgm_cdf",
	"brdm2_atgm_ins",
	"brdm2_atgm_tk_ep1",
	"brdm2_atgm_tk_gue_ep1",
	"brdm2_cdf",
	"brdm2_gue",
	"brdm2_hq_gue",
	"brdm2_hq_tk_gue_ep1",
	"brdm2_ins",
	"brdm2_tk_ep1",
	"brdm2_tk_gue_ep1",
	"btr40_mg_tk_gue_ep1",
	"btr40_mg_tk_ins_ep1",
	"btr40_tk_gue_ep1",
	"btr40_tk_ins_ep1",
	"btr60_tk_ep1",
	"btr90",
	"btr90_hq",
	"car_hatchback",
	"car_sedan",
	"chukar",
	"chukar_ep1",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"fishing_boat",
	"gaz_vodnik",
	"gaz_vodnik_dz",
	"gaz_vodnik_dz_lm",
	"gaz_vodnik_dz_vlm",
	"gaz_vodnik_dze",
	"gaz_vodnik_hmg",
	"gaz_vodnik_medevac",
	"glt_m300_lt",
	"glt_m300_st",
	"grad_cdf",
	"grad_ins",
	"grad_ru",
	"grad_tk_ep1",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"hilux1_civil_3_open_ep1",
	"hmmwv",
	"hmmwv_ambulance",
	"hmmwv_ambulance_cz_des_ep1",
	"hmmwv_ambulance_des_ep1",
	"hmmwv_armored",
	"hmmwv_avenger",
	"hmmwv_avenger_des_ep1",
	"hmmwv_des_ep1",
	"hmmwv_dz",
	"hmmwv_m1035_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1_dz",
	"hmmwv_m1151_m2_cz_des_ep1_dze",
	"hmmwv_m1151_m2_des_ep1",
	"hmmwv_m2",
	"hmmwv_m998_crows_m2_des_ep1",
	"hmmwv_m998_crows_mk19_des_ep1",
	"hmmwv_m998a2_sov_des_ep1",
	"hmmwv_m998a2_sov_des_ep1_dz",
	"hmmwv_m998a2_sov_des_ep1_dze",
	"hmmwv_mk19",
	"hmmwv_mk19_des_ep1",
	"hmmwv_terminal_ep1",
	"hmmwv_tow",
	"hmmwv_tow_des_ep1",
	"ikarus",
	"ikarus_tk_civ_ep1",
	"jetskiyanahui_blue",
	"jetskiyanahui_green",
	"jetskiyanahui_red",
	"jetskiyanahui_yellow",
	"kamaz",
	"kamazopen",
	"kamazreammo",
	"kamazrefuel",
	"kamazrefuel_dz",
	"kamazrepair",
	"l39_tk_ep1",
	"lada1",
	"lada1_gdr",
	"lada1_tk_civ_ep1",
	"lada2",
	"lada2_gdr",
	"lada2_tk_civ_ep1",
	"lada4_gdr",
	"lada5_gdr",
	"lada_base",
	"ladalm",
	"landrover_cz_ep1",
	"landrover_mg_tk_ep1",
	"landrover_mg_tk_ep1_dz",
	"landrover_mg_tk_ep1_dze",
	"landrover_mg_tk_ins_ep1",
	"landrover_special_cz_ep1",
	"landrover_special_cz_ep1_dz",
	"landrover_special_cz_ep1_dze",
	"landrover_spg9_tk_ep1",
	"landrover_spg9_tk_ins_ep1",
	"landrover_tk_civ_ep1",
	"lav25",
	"lav25_hq",
	"m1030",
	"m1030_us_des_ep1",
	"m1126_icv_m2_ep1",
	"m1126_icv_mk19_ep1",
	"m1128_mgs_ep1",
	"m1129_mc_ep1",
	"m1130_cv_ep1",
	"m1133_mev_ep1",
	"m1135_atgmv_ep1",
	"m113_tk_ep1",
	"m113_un_ep1",
	"m113ambul_tk_ep1",
	"m113ambul_tk_ep1_dz",
	"m113ambul_un_ep1",
	"m113ambul_un_ep1_dz",
	"m1a1",
	"m1a1_us_des_ep1",
	"m1a2_tusk_mg",
	"m1a2_us_tusk_mg_ep1",
	"m2a2_ep1",
	"m2a3_ep1",
	"m6_ep1",
	"maz_543_scud_tk_ep1",
	"mlrs",
	"mlrs_des_ep1",
	"mmt_civ",
	"mmt_usmc",
	"mq9predatorb_us_ep1",
	"mtvr",
	"mtvr_des_ep1",
	"mtvrreammo",
	"mtvrreammo_des_ep1",
	"mtvrrefuel",
	"mtvrrefuel_des_ep1",
	"mtvrrefuel_des_ep1_dz",
	"mtvrrepair",
	"mtvrrepair_des_ep1",
	"mtvrsalvage_des_ep1",
	"mtvrsupply_des_ep1",
	"offroad_dshkm_gue",
	"offroad_dshkm_gue_dz",
	"offroad_dshkm_gue_dze",
	"offroad_dshkm_gue_dze1",
	"offroad_dshkm_gue_dze2",
	"offroad_dshkm_gue_dze3",
	"offroad_dshkm_gue_dze4",
	"offroad_dshkm_ins",
	"offroad_dshkm_tk_gue_ep1",
	"offroad_spg9_gue",
	"papercar",
	"pbx",
	"pchela1t",
	"pickup_pk_gue",
	"pickup_pk_gue_dz",
	"pickup_pk_gue_dze",
	"pickup_pk_ins",
	"pickup_pk_ins_dz",
	"pickup_pk_ins_dze",
	"pickup_pk_tk_gue_ep1",
	"pickup_pk_tk_gue_ep1_dz",
	"pickup_pk_tk_gue_ep1_dze",
	"policecar",
	"rhib",
	"rhib2turret",
	"s1203_ambulance_ep1",
	"s1203_tk_civ_ep1",
	"seafox",
	"seafox_ep1",
	"skoda",
	"skodablue",
	"skodagreen",
	"skodared",
	"smallboat_1",
	"smallboat_2",
	"su25_cdf",
	"su25_ins",
	"su25_tk_ep1",
	"su34",
	"su39",
	"suv_blue",
	"suv_camo",
	"suv_charcoal",
	"suv_dz",
	"suv_green",
	"suv_orange",
	"suv_pink",
	"suv_pmc",
	"suv_pmc_baf",
	"suv_red",
	"suv_silver",
	"suv_tk_civ_ep1",
	"suv_tk_ep1",
	"suv_un_ep1",
	"suv_white",
	"suv_yellow",
	"t34",
	"t34_tk_ep1",
	"t34_tk_gue_ep1",
	"t55_tk_ep1",
	"t55_tk_gue_ep1",
	"t72_cdf",
	"t72_gue",
	"t72_ins",
	"t72_ru",
	"t72_tk_ep1",
	"t90",
	"towingtractor",
	"tractor",
	"tractorold",
	"tt650_civ",
	"tt650_gue",
	"tt650_ins",
	"tt650_tk_civ_ep1",
	"tt650_tk_ep1",
	"uaz_ags30_cdf",
	"uaz_ags30_ins",
	"uaz_ags30_ru",
	"uaz_ags30_tk_ep1",
	"uaz_cdf",
	"uaz_ins",
	"uaz_mg_cdf",
	"uaz_mg_cdf",
	"uaz_mg_cdf_dz_lm",
	"uaz_mg_cdf_dz_vlm",
	"uaz_mg_ins",
	"uaz_mg_ins_dz_lm",
	"uaz_mg_ins_dz_vlm",
	"uaz_mg_tk_ep1",
	"uaz_mg_tk_ep1_dz",
	"uaz_mg_tk_ep1_dze",
	"uaz_ru",
	"uaz_spg9_ins",
	"uaz_unarmed_tk_civ_ep1",
	"uaz_unarmed_tk_ep1",
	"uaz_unarmed_un_ep1",
	"ural_cdf",
	"ural_ins",
	"ural_tk_civ_ep1",
	"ural_un_ep1",
	"ural_zu23_cdf",
	"ural_zu23_gue",
	"ural_zu23_ins",
	"ural_zu23_tk_ep1",
	"ural_zu23_tk_gue_ep1",
	"uralcivil",
	"uralcivil2",
	"uralopen_cdf",
	"uralopen_ins",
	"uralreammo_cdf",
	"uralreammo_ins",
	"uralreammo_tk_ep1",
	"uralrefuel_cdf",
	"uralrefuel_ins",
	"uralrefuel_tk_ep1",
	"uralrefuel_tk_ep1_dz",
	"uralrepair_cdf",
	"uralrepair_ins",
	"uralrepair_tk_ep1",
	"uralsalvage_tk_ep1",
	"uralsupply_tk_ep1",
	"v3s_civ",
	"v3s_gue",
	"v3s_open_tk_civ_ep1",
	"v3s_open_tk_ep1",
	"v3s_reammo_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1_dz",
	"v3s_repair_tk_gue_ep1",
	"v3s_salvage_tk_gue_ep1",
	"v3s_supply_tk_gue_ep1",
	"v3s_tk_ep1",
	"v3s_tk_gue_ep1",
	"volha_1_tk_civ_ep1",
	"volha_2_tk_civ_ep1",
	"volhalimo_tk_civ_ep1",
	"vwgolf",
	"warfarereammotruck_cdf",
	"warfarereammotruck_gue",
	"warfarereammotruck_ins",
	"warfarereammotruck_ru",
	"warfarereammotruck_usmc",
	"warfarerepairtruck_gue",
	"warfaresalvagetruck_cdf",
	"warfaresalvagetruck_gue",
	"warfaresalvagetruck_ins",
	"warfaresalvagetruck_ru",
	"warfaresalvagetruck_usmc",
	"warfaresupplytruck_cdf",
	"warfaresupplytruck_gue",
	"warfaresupplytruck_ins",
	"warfaresupplytruck_ru",
	"warfaresupplytruck_usmc",
	"zodiac",
	"zsu_cdf",
	"zsu_ins",
	"zsu_tk_ep1",
	"Civcar",
	"Civcarbu",
	"civcarbl",
	"Civcarre",
	"Civcarge",
	"Civcarwh",
	"Civcarsl",
	"350z",
	"350z_red",
	"350z_kiwi",
	"350z_black",
	"350z_silver",
	"350z_green",
	"350z_blue",
	"350z_gold",
	"350z_white",
	"350z_pink",
	"350z_mod",
	"350z_ruben",
	"350z_v",
	"350z_city",
	"350z_yellow"
];



/*--------------------------------------------------------------------------------------------------------------
	LIST OF VEHICLES WHERE IS TOWABLE
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_ISTOWABLE=[	
	"2s6m_tunguska",
	"aav",
	"armoredsuv_pmc",
	"armoredsuv_pmc_dz",
	"armoredsuv_pmc_dze",
	"atv_cz_ep1",
	"atv_us_ep1",
	"av8b",
	"av8b2",
	"baf_atv_d",
	"baf_atv_w",
	"baf_fv510_d",
	"baf_fv510_w",
	"baf_jackal2_gmg_d",
	"baf_jackal2_gmg_w",
	"baf_jackal2_l2a1_d",
	"baf_jackal2_l2a1_w",
	"baf_offroad_d",
	"baf_offroad_w",
	"bmp2_ambul_cdf",
	"bmp2_ambul_ins",
	"bmp2_cdf",
	"bmp2_gue",
	"bmp2_hq_cdf",
	"bmp2_hq_ins",
	"bmp2_hq_tk_ep1",
	"bmp2_ins",
	"bmp2_tk_ep1",
	"bmp2_un_ep1",
	"bmp3",
	"brdm2_atgm_cdf",
	"brdm2_atgm_ins",
	"brdm2_atgm_tk_ep1",
	"brdm2_atgm_tk_gue_ep1",
	"brdm2_cdf",
	"brdm2_gue",
	"brdm2_hq_gue",
	"brdm2_hq_tk_gue_ep1",
	"brdm2_ins",
	"brdm2_tk_ep1",
	"brdm2_tk_gue_ep1",
	"btr40_mg_tk_gue_ep1",
	"btr40_mg_tk_ins_ep1",
	"btr40_tk_gue_ep1",
	"btr40_tk_ins_ep1",
	"btr60_tk_ep1",
	"btr90",
	"btr90_hq",
	"car_hatchback",
	"car_sedan",
	"chukar",
	"chukar_ep1",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"fishing_boat",
	"gaz_vodnik",
	"gaz_vodnik_dz",
	"gaz_vodnik_dz_lm",
	"gaz_vodnik_dz_vlm",
	"gaz_vodnik_dze",
	"gaz_vodnik_hmg",
	"gaz_vodnik_medevac",
	"glt_m300_lt",
	"glt_m300_st",
	"grad_cdf",
	"grad_ins",
	"grad_ru",
	"grad_tk_ep1",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"hilux1_civil_3_open_ep1",
	"hmmwv",
	"hmmwv_ambulance",
	"hmmwv_ambulance_cz_des_ep1",
	"hmmwv_ambulance_des_ep1",
	"hmmwv_armored",
	"hmmwv_avenger",
	"hmmwv_avenger_des_ep1",
	"hmmwv_des_ep1",
	"hmmwv_dz",
	"hmmwv_m1035_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1_dz",
	"hmmwv_m1151_m2_cz_des_ep1_dze",
	"hmmwv_m1151_m2_des_ep1",
	"hmmwv_m2",
	"hmmwv_m998_crows_m2_des_ep1",
	"hmmwv_m998_crows_mk19_des_ep1",
	"hmmwv_m998a2_sov_des_ep1",
	"hmmwv_m998a2_sov_des_ep1_dz",
	"hmmwv_m998a2_sov_des_ep1_dze",
	"hmmwv_mk19",
	"hmmwv_mk19_des_ep1",
	"hmmwv_terminal_ep1",
	"hmmwv_tow",
	"hmmwv_tow_des_ep1",
	"ikarus",
	"ikarus_tk_civ_ep1",
	"jetskiyanahui_blue",
	"jetskiyanahui_green",
	"jetskiyanahui_red",
	"jetskiyanahui_yellow",
	"kamaz",
	"kamazopen",
	"kamazreammo",
	"kamazrefuel",
	"kamazrefuel_dz",
	"kamazrepair",
	"l39_tk_ep1",
	"lada1",
	"lada1_gdr",
	"lada1_tk_civ_ep1",
	"lada2",
	"lada2_gdr",
	"lada2_tk_civ_ep1",
	"lada4_gdr",
	"lada5_gdr",
	"lada_base",
	"ladalm",
	"landrover_cz_ep1",
	"landrover_mg_tk_ep1",
	"landrover_mg_tk_ep1_dz",
	"landrover_mg_tk_ep1_dze",
	"landrover_mg_tk_ins_ep1",
	"landrover_special_cz_ep1",
	"landrover_special_cz_ep1_dz",
	"landrover_special_cz_ep1_dze",
	"landrover_spg9_tk_ep1",
	"landrover_spg9_tk_ins_ep1",
	"landrover_tk_civ_ep1",
	"lav25",
	"lav25_hq",
	"m1030",
	"m1030_us_des_ep1",
	"m1126_icv_m2_ep1",
	"m1126_icv_mk19_ep1",
	"m1128_mgs_ep1",
	"m1129_mc_ep1",
	"m1130_cv_ep1",
	"m1133_mev_ep1",
	"m1135_atgmv_ep1",
	"m113_tk_ep1",
	"m113_un_ep1",
	"m113ambul_tk_ep1",
	"m113ambul_tk_ep1_dz",
	"m113ambul_un_ep1",
	"m113ambul_un_ep1_dz",
	"m1a1",
	"m1a1_us_des_ep1",
	"m1a2_tusk_mg",
	"m1a2_us_tusk_mg_ep1",
	"m2a2_ep1",
	"m2a3_ep1",
	"m6_ep1",
	"maz_543_scud_tk_ep1",
	"mlrs",
	"mlrs_des_ep1",
	"mmt_civ",
	"mmt_usmc",
	"mq9predatorb_us_ep1",
	"mtvr",
	"mtvr_des_ep1",
	"mtvrreammo",
	"mtvrreammo_des_ep1",
	"mtvrrefuel",
	"mtvrrefuel_des_ep1",
	"mtvrrefuel_des_ep1_dz",
	"mtvrrepair",
	"mtvrrepair_des_ep1",
	"mtvrsalvage_des_ep1",
	"mtvrsupply_des_ep1",
	"offroad_dshkm_gue",
	"offroad_dshkm_gue_dz",
	"offroad_dshkm_gue_dze",
	"offroad_dshkm_gue_dze1",
	"offroad_dshkm_gue_dze2",
	"offroad_dshkm_gue_dze3",
	"offroad_dshkm_gue_dze4",
	"offroad_dshkm_ins",
	"offroad_dshkm_tk_gue_ep1",
	"offroad_spg9_gue",
	"offroad_spg9_tk_gue_ep1",
	"old_bike_tk_civ_ep1",
	"old_bike_tk_ins_ep1",
	"old_moto_tk_civ_ep1",
	"papercar",
	"pbx",
	"pchela1t",
	"pickup_pk_gue",
	"pickup_pk_gue_dz",
	"pickup_pk_gue_dze",
	"pickup_pk_ins",
	"pickup_pk_ins_dz",
	"pickup_pk_ins_dze",
	"pickup_pk_tk_gue_ep1",
	"pickup_pk_tk_gue_ep1_dz",
	"pickup_pk_tk_gue_ep1_dze",
	"policecar",
	"rhib",
	"rhib2turret",
	"s1203_ambulance_ep1",
	"s1203_tk_civ_ep1",
	"seafox",
	"seafox_ep1",
	"skoda",
	"skodablue",
	"skodagreen",
	"skodared",
	"smallboat_1",
	"smallboat_2",
	"su25_cdf",
	"su25_ins",
	"su25_tk_ep1",
	"su34",
	"su39",
	"suv_blue",
	"suv_camo",
	"suv_charcoal",
	"suv_dz",
	"suv_green",
	"suv_orange",
	"suv_pink",
	"suv_pmc",
	"suv_pmc_baf",
	"suv_red",
	"suv_silver",
	"suv_tk_civ_ep1",
	"suv_tk_ep1",
	"suv_un_ep1",
	"suv_white",
	"suv_yellow",
	"t34",
	"t34_tk_ep1",
	"t34_tk_gue_ep1",
	"t55_tk_ep1",
	"t55_tk_gue_ep1",
	"t72_cdf",
	"t72_gue",
	"t72_ins",
	"t72_ru",
	"t72_tk_ep1",
	"t90",
	"towingtractor",
	"tractor",
	"tractorold",
	"tt650_civ",
	"tt650_gue",
	"tt650_ins",
	"tt650_tk_civ_ep1",
	"tt650_tk_ep1",
	"uaz_ags30_cdf",
	"uaz_ags30_ins",
	"uaz_ags30_ru",
	"uaz_ags30_tk_ep1",
	"uaz_cdf",
	"uaz_ins",
	"uaz_mg_cdf",
	"uaz_mg_cdf",
	"uaz_mg_cdf_dz_lm",
	"uaz_mg_cdf_dz_vlm",
	"uaz_mg_ins",
	"uaz_mg_ins_dz_lm",
	"uaz_mg_ins_dz_vlm",
	"uaz_mg_tk_ep1",
	"uaz_mg_tk_ep1_dz",
	"uaz_mg_tk_ep1_dze",
	"uaz_ru",
	"uaz_spg9_ins",
	"uaz_unarmed_tk_civ_ep1",
	"uaz_unarmed_tk_ep1",
	"uaz_unarmed_un_ep1",
	"ural_cdf",
	"ural_ins",
	"ural_tk_civ_ep1",
	"ural_un_ep1",
	"ural_zu23_cdf",
	"ural_zu23_gue",
	"ural_zu23_ins",
	"ural_zu23_tk_ep1",
	"ural_zu23_tk_gue_ep1",
	"uralcivil",
	"uralcivil2",
	"uralopen_cdf",
	"uralopen_ins",
	"uralreammo_cdf",
	"uralreammo_ins",
	"uralreammo_tk_ep1",
	"uralrefuel_cdf",
	"uralrefuel_ins",
	"uralrefuel_tk_ep1",
	"uralrefuel_tk_ep1_dz",
	"uralrepair_cdf",
	"uralrepair_ins",
	"uralrepair_tk_ep1",
	"uralsalvage_tk_ep1",
	"uralsupply_tk_ep1",
	"v3s_civ",
	"v3s_gue",
	"v3s_open_tk_civ_ep1",
	"v3s_open_tk_ep1",
	"v3s_reammo_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1_dz",
	"v3s_repair_tk_gue_ep1",
	"v3s_salvage_tk_gue_ep1",
	"v3s_supply_tk_gue_ep1",
	"v3s_tk_ep1",
	"v3s_tk_gue_ep1",
	"volha_1_tk_civ_ep1",
	"volha_2_tk_civ_ep1",
	"volhalimo_tk_civ_ep1",
	"vwgolf",
	"warfarereammotruck_cdf",
	"warfarereammotruck_gue",
	"warfarereammotruck_ins",
	"warfarereammotruck_ru",
	"warfarereammotruck_usmc",
	"warfarerepairtruck_gue",
	"warfaresalvagetruck_cdf",
	"warfaresalvagetruck_gue",
	"warfaresalvagetruck_ins",
	"warfaresalvagetruck_ru",
	"warfaresalvagetruck_usmc",
	"warfaresupplytruck_cdf",
	"warfaresupplytruck_gue",
	"warfaresupplytruck_ins",
	"warfaresupplytruck_ru",
	"warfaresupplytruck_usmc",
	"zodiac",
	"zsu_cdf",
	"zsu_ins",
	"zsu_tk_ep1",
	"Civcar",
	"Civcarbu",
	"civcarbl",
	"Civcarre",
	"Civcarge",
	"Civcarwh",
	"Civcarsl",
	"350z",
	"350z_red",
	"350z_kiwi",
	"350z_black",
	"350z_silver",
	"350z_green",
	"350z_blue",
	"350z_gold",
	"350z_white",
	"350z_pink",
	"350z_mod",
	"350z_ruben",
	"350z_v",
	"350z_city",
	"350z_yellow"
	];




/*--------------------------------------------------------------------------------------------------------------
	LIST OF HELIS WHERE CAN LIFT
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_CANLIFT=[
"USEC_ch53_E",
"Mi17_medevac_Ins",
"Mi17_medevac_CDF",
"Mi17_medevac_RU",
"BAF_Merlin_DZE",
"MV22_DZ",
"Mi17_Civilian_DZ",
"CH53_DZE",
"UH60M_MEV_EP1",
"Ka137_PMC",
"Ka60_PMC",
"CH_47F_EP1_DZE",
"CH_47F_EP1_DZ",
"UH1H_DZ",
"Mi17_DZ",
"UH60M_EP1_DZ",
"UH1Y_DZ",
"UH1Y_DZE",
"MH60S_DZ",
"MH60S_DZE",
"AH6J_EP1_DZ",
"AW159_Lynx_BAF",
"Mi17_Civilian_DZ",
"AH6X_DZ",
"MH6J_DZ",
"UH60M_EP1_DZE"

];




/*--------------------------------------------------------------------------------------------------------------
		LIST OF VEHICLES WHERE IS LIFTABLE
---------------------------------------------------------------------------------------------------------------*/ 

LOG_CFG_ISLIFTABLE=[
"USEC_ch53_E",
"Mi17_medevac_Ins",
"Mi17_medevac_CDF",
"Mi17_medevac_RU",
"BAF_Merlin_DZE",
"MV22_DZ",
"Mi17_Civilian_DZ",
"CH53_DZE",
"UH60M_MEV_EP1",
"Ka137_PMC",
"Ka60_PMC",
"CH_47F_EP1_DZE",
"CH_47F_EP1_DZ",
"UH1H_DZ",
"Mi17_DZ",
"UH60M_EP1_DZ",
"UH1Y_DZ",
"MH60S_DZ",
"AH6J_EP1_DZ",
"AW159_Lynx_BAF",
"GNT_C185",
"GNT_C185F",
"GNT_C185R",
"GNT_C185E",
"GNT_C185C",
"GNT_C185T",
"GNT_C185U",
"CYBP_Camel_us",
"CYBP_Camel_rus",
"CYBP_Camel_civ",
"AN2_DZ",
"C130J_US_EP1_DZ",
"An2_1_TK_CIV_EP1",
"An2_2_TK_CIV_EP1",
"An2_TK_EP1",
"CVPI_Patrol",
"CVPI_Trooper_Patrol",
"CVPI_TrooperSL_Patrol",
"CVPI_NYPD_Patrol",
"CVPI_HighwaySL_Patrol",
"CVPI_UnmarkedB_Patrol",
"CVPI_UnmarkedG_Patrol",
"CVPI_LAPD_Patrol",
"CVPI_UnmarkedW_Patrol",
"CVPI_LAPDSL_Patrol",
"CVPI_NYPDSL_Patrol",
"Tractor",
"policecar",
"Civcar",
"Civcarbu",
"civcarbl",
"Civcarre",
"Civcarge",
"Civcarwh",
"Civcarsl",
"Copcar",
"Copcarhw",
"Copcarswat",
"350z",
"350z_red",
"350z_kiwi",
"350z_black",
"350z_silver",
"350z_green",
"350z_blue",
"350z_gold",
"350z_white",
"350z_pink",
"350z_mod",
"350z_ruben",
"350z_v",
"350z_city",
"350z_yellow",
"HMMWV_M2",
"HMMWV_M2_USArmy",
"HMMWV",
"Ural_CDF",
"Ural_INS",
"UralCivil",
"UralCivil2",
"tractorOld",
"GLT_M300_LT",
"GLT_M300_ST",
"GAZ_Vodnik_MedEvac",
"HMMWV_Armored",
"HMMWV_Ambulance",
"Ikarus",
"MMT_USMC",
"MMT_Civ",
"MTVR",
"TowingTractor",
"V3S_Civ",
"V3S_Gue",
"TT650_Civ",
"TT650_Ins",
"TT650_Gue",
"Ural_UN_EP1",
"Ural_TK_CIV_EP1",
"HMMWV_DES_EP1",
"HMMWV_Ambulance_DES_EP1",
"HMMWV_Ambulance_CZ_DES_EP1",
"TT650_TK_CIV_EP1",
"TT650_TK_EP1",
"M1030_US_DES_EP1",
"MTVR_DES_EP1",
"Ikarus_TK_CIV_EP1",
"ATV_US_EP1",
"ATV_CZ_EP1",
"BRDM2_HQ_TK_GUE_EP1",
"BTR40_MG_TK_GUE_EP1",
"BTR40_TK_GUE_EP1",
"BTR40_MG_TK_INS_EP1",
"BTR40_TK_INS_EP1",
"HMMWV_M1035_DES_EP1",
"HMMWV_Terminal_EP1",
"LandRover_CZ_EP1",
"LandRover_TK_CIV_EP1",
"LandRover_MG_TK_INS_EP1",
"LandRover_MG_TK_EP1",
"Old_bike_TK_CIV_EP1",
"Old_bike_TK_INS_EP1",
"Old_moto_TK_Civ_EP1",
"S1203_TK_CIV_EP1",
"S1203_ambulance_EP1",
"M1133_MEV_EP1",
"HMMWV_DZ",
"HMMWV_M998A2_SOV_DES_EP1_DZE",
"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
"LandRover_Special_CZ_EP1_DZE",
"LandRover_MG_TK_EP1_DZE",
"UAZ_MG_TK_EP1_DZE",
"GAZ_Vodnik_DZE",
"ArmoredSUV_PMC_DZE",
"Pickup_PK_GUE_DZE",
"Pickup_PK_TK_GUE_EP1_DZE",
"Pickup_PK_INS_DZE",
"Pickup_PK_GUE_DZE1",
"Pickup_PK_TK_GUE_EP1_DZE1",
"Pickup_PK_INS_DZE1",
"Pickup_PK_GUE_DZE2",
"Pickup_PK_TK_GUE_EP1_DZE2",
"Pickup_PK_INS_DZE2",
"Pickup_PK_GUE_DZE3",
"Pickup_PK_TK_GUE_EP1_DZE3",
"Pickup_PK_INS_DZE3",
"Pickup_PK_GUE_DZE4",
"Pickup_PK_TK_GUE_EP1_DZE4",
"Pickup_PK_INS_DZE4",
"Offroad_DSHKM_Gue_DZE",
"Offroad_DSHKM_Gue_DZE1",
"Offroad_DSHKM_Gue_DZE2",
"Offroad_DSHKM_Gue_DZE3",
"Offroad_DSHKM_Gue_DZE4",
"BTR90_DZE",
"BTR90_HQ_DZE",
"LAV25_DZE",
"LAV25_HQ_DZE",
"V3S_TK_EP1_DZE",
"V3S_Refuel_TK_GUE_EP1_DZ",
"UralCivil_DZE",
"UralCivil2_DZE",
"UralRefuel_TK_EP1_DZ",
"KamazOpen_DZE",
"KamazRefuel_DZ",
"MtvrRefuel_DES_EP1_DZ",
"MtvrRefuel_DZ",
"VolhaLimo_TK_CIV_EP1_DZE1",
"Volha_1_TK_CIV_EP1_DZE1",
"Volha_2_TK_CIV_EP1_DZE1",
"VolhaLimo_TK_CIV_EP1_DZE2",
"Volha_1_TK_CIV_EP1_DZE2",
"Volha_2_TK_CIV_EP1_DZE2",
"VolhaLimo_TK_CIV_EP1_DZE3",
"Volha_1_TK_CIV_EP1_DZE3",
"Volha_2_TK_CIV_EP1_DZE3",
"VolhaLimo_TK_CIV_EP1_DZE4",
"Volha_1_TK_CIV_EP1_DZE4",
"Volha_2_TK_CIV_EP1_DZE4",
"VWGolf_DZE1",
"VWGolf_DZE2",
"VWGolf_DZE3",
"VWGolf_DZE4",
"Skoda_DZE1",
"SkodaBlue_DZE1",
"SkodaRed_DZE1",
"SkodaGreen_DZE1",
"Skoda_DZE2",
"SkodaBlue_DZE2",
"SkodaRed_DZE2",
"SkodaGreen_DZE2",
"Skoda_DZE3",
"SkodaBlue_DZE3",
"SkodaRed_DZE3",
"SkodaGreen_DZE3",
"Skoda_DZE4",
"SkodaBlue_DZE4",
"SkodaRed_DZE4",
"SkodaGreen_DZE4",
"car_hatchback_DZE1",
"car_hatchback_DZE2",
"car_hatchback_DZE3",
"car_hatchback_DZE4",
"car_sedan_DZE1",
"car_sedan_DZE2",
"car_sedan_DZE3",
"car_sedan_DZE4",
"datsun1_civil_1_open_DZE",
"datsun1_civil_2_covered_DZE",
"datsun1_civil_3_open_DZE",
"datsun1_civil_1_open_DZE1",
"datsun1_civil_2_covered_DZE1",
"datsun1_civil_3_open_DZE1",
"datsun1_civil_1_open_DZE2",
"datsun1_civil_2_covered_DZE2",
"datsun1_civil_3_open_DZE2",
"datsun1_civil_1_open_DZE3",
"datsun1_civil_2_covered_DZE3",
"datsun1_civil_3_open_DZE3",
"datsun1_civil_1_open_DZE4",
"datsun1_civil_2_covered_DZE4",
"datsun1_civil_3_open_DZE4",
"Lada1_DZE1",
"Lada2_DZE1",
"LadaLM_DZE1",
"Lada1_TK_CIV_EP1_DZE1",
"Lada2_TK_CIV_EP1_DZE1",
"Lada1_DZE2",
"Lada2_DZE2",
"LadaLM_DZE2",
"Lada1_TK_CIV_EP1_DZE2",
"Lada2_TK_CIV_EP1_DZE2",
"Lada1_DZE3",
"Lada2_DZE3",
"LadaLM_DZE3",
"Lada1_TK_CIV_EP1_DZE3",
"Lada2_TK_CIV_EP1_DZE3",
"Lada1_DZE4",
"Lada2_DZE4",
"LadaLM_DZE4",
"Lada1_TK_CIV_EP1_DZE4",
"Lada2_TK_CIV_EP1_DZE4",
"hilux1_civil_1_open_DZE",
"hilux1_civil_2_covered_DZE",
"hilux1_civil_3_open_DZE",
"hilux1_civil_1_open_DZE1",
"hilux1_civil_2_covered_DZE1",
"hilux1_civil_3_open_DZE1",
"hilux1_civil_1_open_DZE2",
"hilux1_civil_2_covered_DZE2",
"hilux1_civil_3_open_DZE2",
"hilux1_civil_1_open_DZE3",
"hilux1_civil_2_covered_DZE3",
"hilux1_civil_3_open_DZE3",
"hilux1_civil_1_open_DZE4",
"hilux1_civil_2_covered_DZE4",
"hilux1_civil_3_open_DZE4",
"UAZ_CDF_DZE1",
"UAZ_INS_DZE1",
"UAZ_RU_DZE1",
"UAZ_Unarmed_TK_EP1_DZE1",
"UAZ_Unarmed_UN_EP1_DZE1",
"UAZ_Unarmed_TK_CIV_EP1_DZE1",
"UAZ_CDF_DZE2",
"UAZ_INS_DZE2",
"UAZ_RU_DZE2",
"UAZ_Unarmed_TK_EP1_DZE2",
"UAZ_Unarmed_UN_EP1_DZE2",
"UAZ_Unarmed_TK_CIV_EP1_DZE2",
"UAZ_CDF_DZE3",
"UAZ_INS_DZE3",
"UAZ_RU_DZE3",
"UAZ_Unarmed_TK_EP1_DZE3",
"UAZ_Unarmed_UN_EP1_DZE3",
"UAZ_Unarmed_TK_CIV_EP1_DZE3",
"UAZ_CDF_DZE4",
"UAZ_INS_DZE4",
"UAZ_RU_DZE4",
"UAZ_Unarmed_TK_EP1_DZE4",
"UAZ_Unarmed_UN_EP1_DZE4",
"UAZ_Unarmed_TK_CIV_EP1_DZE4",
"SUV_TK_CIV_EP1_DZE1",
"SUV_Camo_DZE1",
"SUV_Blue_DZE1",
"SUV_Green_DZE1",
"SUV_Yellow_DZE1",
"SUV_Red_DZE1",
"SUV_White_DZE1",
"SUV_Pink_DZE1",
"SUV_Charcoal_DZE1",
"SUV_Orange_DZE1",
"SUV_Silver_DZE1",
"SUV_TK_CIV_EP1_DZE2",
"SUV_Camo_DZE2",
"SUV_Blue_DZE2",
"SUV_Green_DZE2",
"SUV_Yellow_DZE2",
"SUV_Red_DZE2",
"SUV_White_DZE2",
"SUV_Pink_DZE2",
"SUV_Charcoal_DZE2",
"SUV_Orange_DZE2",
"SUV_Silver_DZE2",
"SUV_TK_CIV_EP1_DZE3",
"SUV_Camo_DZE3",
"SUV_Blue_DZE3",
"SUV_Green_DZE3",
"SUV_Yellow_DZE3",
"SUV_Red_DZE3",
"SUV_White_DZE3",
"SUV_Pink_DZE3",
"SUV_Charcoal_DZE3",
"SUV_Orange_DZE3",
"SUV_Silver_DZE3",
"SUV_TK_CIV_EP1_DZE4",
"SUV_Camo_DZE4",
"SUV_Blue_DZE4",
"SUV_Green_DZE4",
"SUV_Yellow_DZE4",
"SUV_Red_DZE4",
"SUV_White_DZE4",
"SUV_Pink_DZE4",
"SUV_Charcoal_DZE4",
"SUV_Orange_DZE4",
"SUV_Silver_DZE4",
"M113Ambul_UN_EP1_DZ",
"M113Ambul_TK_EP1_DZ",
"BAF_ATV_D",
"BAF_Offroad_D",
"BAF_Jackal2_L2A1_D",
"BAF_ATV_W",
"BAF_Offroad_W",
"BAF_Jackal2_L2A1_W",
"BAF_Jackal2_GMG_W",
"2s6m_tunguska",
	"aav",
	"armoredsuv_pmc",
	"armoredsuv_pmc_dz",
	"armoredsuv_pmc_dze",
	"atv_cz_ep1",
	"atv_us_ep1",
	"av8b",
	"av8b2",
	"baf_atv_d",
	"baf_atv_w",
	"baf_fv510_d",
	"baf_fv510_w",
	"baf_jackal2_gmg_d",
	"baf_jackal2_gmg_w",
	"baf_jackal2_l2a1_d",
	"baf_jackal2_l2a1_w",
	"baf_offroad_d",
	"baf_offroad_w",
	"bmp2_ambul_cdf",
	"bmp2_ambul_ins",
	"bmp2_cdf",
	"bmp2_gue",
	"bmp2_hq_cdf",
	"bmp2_hq_ins",
	"bmp2_hq_tk_ep1",
	"bmp2_ins",
	"bmp2_tk_ep1",
	"bmp2_un_ep1",
	"bmp3",
	"brdm2_atgm_cdf",
	"brdm2_atgm_ins",
	"brdm2_atgm_tk_ep1",
	"brdm2_atgm_tk_gue_ep1",
	"brdm2_cdf",
	"brdm2_gue",
	"brdm2_hq_gue",
	"brdm2_hq_tk_gue_ep1",
	"brdm2_ins",
	"brdm2_tk_ep1",
	"brdm2_tk_gue_ep1",
	"btr40_mg_tk_gue_ep1",
	"btr40_mg_tk_ins_ep1",
	"btr40_tk_gue_ep1",
	"btr40_tk_ins_ep1",
	"btr60_tk_ep1",
	"btr90",
	"btr90_hq",
	"car_hatchback",
	"car_sedan",
	"chukar",
	"chukar_ep1",
	"datsun1_civil_1_open",
	"datsun1_civil_2_covered",
	"datsun1_civil_3_open",
	"fishing_boat",
	"gaz_vodnik",
	"gaz_vodnik_dz",
	"gaz_vodnik_dz_lm",
	"gaz_vodnik_dz_vlm",
	"gaz_vodnik_dze",
	"gaz_vodnik_hmg",
	"gaz_vodnik_medevac",
	"glt_m300_lt",
	"glt_m300_st",
	"grad_cdf",
	"grad_ins",
	"grad_ru",
	"grad_tk_ep1",
	"hilux1_civil_1_open",
	"hilux1_civil_2_covered",
	"hilux1_civil_3_open",
	"hilux1_civil_3_open_ep1",
	"hmmwv",
	"hmmwv_ambulance",
	"hmmwv_ambulance_cz_des_ep1",
	"hmmwv_ambulance_des_ep1",
	"hmmwv_armored",
	"hmmwv_avenger",
	"hmmwv_avenger_des_ep1",
	"hmmwv_des_ep1",
	"hmmwv_dz",
	"hmmwv_m1035_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1",
	"hmmwv_m1151_m2_cz_des_ep1_dz",
	"hmmwv_m1151_m2_cz_des_ep1_dze",
	"hmmwv_m1151_m2_des_ep1",
	"hmmwv_m2",
	"hmmwv_m998_crows_m2_des_ep1",
	"hmmwv_m998_crows_mk19_des_ep1",
	"hmmwv_m998a2_sov_des_ep1",
	"hmmwv_m998a2_sov_des_ep1_dz",
	"hmmwv_m998a2_sov_des_ep1_dze",
	"hmmwv_mk19",
	"hmmwv_mk19_des_ep1",
	"hmmwv_terminal_ep1",
	"hmmwv_tow",
	"hmmwv_tow_des_ep1",
	"ikarus",
	"ikarus_tk_civ_ep1",
	"jetskiyanahui_blue",
	"jetskiyanahui_green",
	"jetskiyanahui_red",
	"jetskiyanahui_yellow",
	"kamaz",
	"kamazopen",
	"kamazreammo",
	"kamazrefuel",
	"kamazrefuel_dz",
	"kamazrepair",
	"l39_tk_ep1",
	"lada1",
	"lada1_gdr",
	"lada1_tk_civ_ep1",
	"lada2",
	"lada2_gdr",
	"lada2_tk_civ_ep1",
	"lada4_gdr",
	"lada5_gdr",
	"lada_base",
	"ladalm",
	"landrover_cz_ep1",
	"landrover_mg_tk_ep1",
	"landrover_mg_tk_ep1_dz",
	"landrover_mg_tk_ep1_dze",
	"landrover_mg_tk_ins_ep1",
	"landrover_special_cz_ep1",
	"landrover_special_cz_ep1_dz",
	"landrover_special_cz_ep1_dze",
	"landrover_spg9_tk_ep1",
	"landrover_spg9_tk_ins_ep1",
	"landrover_tk_civ_ep1",
	"lav25",
	"lav25_hq",
	"m1030",
	"m1030_us_des_ep1",
	"m1126_icv_m2_ep1",
	"m1126_icv_mk19_ep1",
	"m1128_mgs_ep1",
	"m1129_mc_ep1",
	"m1130_cv_ep1",
	"m1133_mev_ep1",
	"m1135_atgmv_ep1",
	"m113_tk_ep1",
	"m113_un_ep1",
	"m113ambul_tk_ep1",
	"m113ambul_tk_ep1_dz",
	"m113ambul_un_ep1",
	"m113ambul_un_ep1_dz",
	"m1a1",
	"m1a1_us_des_ep1",
	"m1a2_tusk_mg",
	"m1a2_us_tusk_mg_ep1",
	"m2a2_ep1",
	"m2a3_ep1",
	"m6_ep1",
	"maz_543_scud_tk_ep1",
	"mlrs",
	"mlrs_des_ep1",
	"mmt_civ",
	"mmt_usmc",
	"mq9predatorb_us_ep1",
	"mtvr",
	"mtvr_des_ep1",
	"mtvrreammo",
	"mtvrreammo_des_ep1",
	"mtvrrefuel",
	"mtvrrefuel_des_ep1",
	"mtvrrefuel_des_ep1_dz",
	"mtvrrepair",
	"mtvrrepair_des_ep1",
	"mtvrsalvage_des_ep1",
	"mtvrsupply_des_ep1",
	"offroad_dshkm_gue",
	"offroad_dshkm_gue_dz",
	"offroad_dshkm_gue_dze",
	"offroad_dshkm_gue_dze1",
	"offroad_dshkm_gue_dze2",
	"offroad_dshkm_gue_dze3",
	"offroad_dshkm_gue_dze4",
	"offroad_dshkm_ins",
	"offroad_dshkm_tk_gue_ep1",
	"offroad_spg9_gue",
	"papercar",
	"pbx",
	"pchela1t",
	"pickup_pk_gue",
	"pickup_pk_gue_dz",
	"pickup_pk_gue_dze",
	"pickup_pk_ins",
	"pickup_pk_ins_dz",
	"pickup_pk_ins_dze",
	"pickup_pk_tk_gue_ep1",
	"pickup_pk_tk_gue_ep1_dz",
	"pickup_pk_tk_gue_ep1_dze",
	"policecar",
	"rhib",
	"rhib2turret",
	"s1203_ambulance_ep1",
	"s1203_tk_civ_ep1",
	"seafox",
	"seafox_ep1",
	"skoda",
	"skodablue",
	"skodagreen",
	"skodared",
	"smallboat_1",
	"smallboat_2",
	"su25_cdf",
	"su25_ins",
	"su25_tk_ep1",
	"su34",
	"su39",
	"suv_blue",
	"suv_camo",
	"suv_charcoal",
	"suv_dz",
	"suv_green",
	"suv_orange",
	"suv_pink",
	"suv_pmc",
	"suv_pmc_baf",
	"suv_red",
	"suv_silver",
	"suv_tk_civ_ep1",
	"suv_tk_ep1",
	"suv_un_ep1",
	"suv_white",
	"suv_yellow",
	"t34",
	"t34_tk_ep1",
	"t34_tk_gue_ep1",
	"t55_tk_ep1",
	"t55_tk_gue_ep1",
	"t72_cdf",
	"t72_gue",
	"t72_ins",
	"t72_ru",
	"t72_tk_ep1",
	"t90",
	"towingtractor",
	"tractor",
	"tractorold",
	"tt650_civ",
	"tt650_gue",
	"tt650_ins",
	"tt650_tk_civ_ep1",
	"tt650_tk_ep1",
	"uaz_ags30_cdf",
	"uaz_ags30_ins",
	"uaz_ags30_ru",
	"uaz_ags30_tk_ep1",
	"uaz_cdf",
	"uaz_ins",
	"uaz_mg_cdf",
	"uaz_mg_cdf",
	"uaz_mg_cdf_dz_lm",
	"uaz_mg_cdf_dz_vlm",
	"uaz_mg_ins",
	"uaz_mg_ins_dz_lm",
	"uaz_mg_ins_dz_vlm",
	"uaz_mg_tk_ep1",
	"uaz_mg_tk_ep1_dz",
	"uaz_mg_tk_ep1_dze",
	"uaz_ru",
	"uaz_spg9_ins",
	"uaz_unarmed_tk_civ_ep1",
	"uaz_unarmed_tk_ep1",
	"uaz_unarmed_un_ep1",
	"ural_cdf",
	"ural_ins",
	"ural_tk_civ_ep1",
	"ural_un_ep1",
	"ural_zu23_cdf",
	"ural_zu23_gue",
	"ural_zu23_ins",
	"ural_zu23_tk_ep1",
	"ural_zu23_tk_gue_ep1",
	"uralcivil",
	"uralcivil2",
	"uralopen_cdf",
	"uralopen_ins",
	"uralreammo_cdf",
	"uralreammo_ins",
	"uralreammo_tk_ep1",
	"uralrefuel_cdf",
	"uralrefuel_ins",
	"uralrefuel_tk_ep1",
	"uralrefuel_tk_ep1_dz",
	"uralrepair_cdf",
	"uralrepair_ins",
	"uralrepair_tk_ep1",
	"uralsalvage_tk_ep1",
	"uralsupply_tk_ep1",
	"v3s_civ",
	"v3s_gue",
	"v3s_open_tk_civ_ep1",
	"v3s_open_tk_ep1",
	"v3s_reammo_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1",
	"v3s_refuel_tk_gue_ep1_dz",
	"v3s_repair_tk_gue_ep1",
	"v3s_salvage_tk_gue_ep1",
	"v3s_supply_tk_gue_ep1",
	"v3s_tk_ep1",
	"v3s_tk_gue_ep1",
	"volha_1_tk_civ_ep1",
	"volha_2_tk_civ_ep1",
	"volhalimo_tk_civ_ep1",
	"vwgolf",
	"warfarereammotruck_cdf",
	"warfarereammotruck_gue",
	"warfarereammotruck_ins",
	"warfarereammotruck_ru",
	"warfarereammotruck_usmc",
	"warfarerepairtruck_gue",
	"warfaresalvagetruck_cdf",
	"warfaresalvagetruck_gue",
	"warfaresalvagetruck_ins",
	"warfaresalvagetruck_ru",
	"warfaresalvagetruck_usmc",
	"warfaresupplytruck_cdf",
	"warfaresupplytruck_gue",
	"warfaresupplytruck_ins",
	"warfaresupplytruck_ru",
	"warfaresupplytruck_usmc",
	"zodiac",
	"zsu_cdf",
	"zsu_ins",
	"zsu_tk_ep1",
	"Civcar",
	"Civcarbu",
	"civcarbl",
	"Civcarre",
	"Civcarge",
	"Civcarwh",
	"Civcarsl",
	"350z",
	"350z_red",
	"350z_kiwi",
	"350z_black",
	"350z_silver",
	"350z_green",
	"350z_blue",
	"350z_gold",
	"350z_white",
	"350z_pink",
	"350z_mod",
	"350z_ruben",
	"350z_v",
	"350z_city",
	"350z_yellow"
];