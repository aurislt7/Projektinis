FOR /L %%A IN (3000, 1, 3100) DO (
  pvengine.exe /render lapuociai.pov -V -GD -GR -GW Warning_Level=0 All_Console=Off +W80 +H60 +oC:\Users\auris\Desktop\Informatics\7_semestras\Projektinis\Generated_Forests\Test\Lapuociai\Vasara\%%A DECLARE=seed_num=%%A DECLARE=season_num=0 DECLARE=forest_num=0
)
FOR /L %%A IN (3100, 1, 3200) DO (
  pvengine.exe /render lapuociai.pov -V -GD -GR -GW Warning_Level=0 All_Console=Off +W80 +H60 +oC:\Users\auris\Desktop\Informatics\7_semestras\Projektinis\Generated_Forests\Test\Lapuociai\Ruduo\%%A DECLARE=seed_num=%%A DECLARE=season_num=1 DECLARE=forest_num=0
)
FOR /L %%A IN (3200, 1, 3300) DO (
  pvengine.exe /render lapuociai.pov -V -GD -GR -GW Warning_Level=0 All_Console=Off +W80 +H60 +oC:\Users\auris\Desktop\Informatics\7_semestras\Projektinis\Generated_Forests\Test\Lapuociai\Ziema\%%A DECLARE=seed_num=%%A DECLARE=season_num=2 DECLARE=forest_num=0
)
FOR /L %%A IN (3300, 1, 3400) DO (
  pvengine.exe /render lapuociai.pov -V -GD -GR -GW Warning_Level=0 All_Console=Off +W80 +H60 +oC:\Users\auris\Desktop\Informatics\7_semestras\Projektinis\Generated_Forests\Test\Spygliuociai\Vasara\%%A DECLARE=seed_num=%%A DECLARE=season_num=0 DECLARE=forest_num=1
)
FOR /L %%A IN (3400, 1, 3500) DO (
  pvengine.exe /render lapuociai.pov -V -GD -GR -GW Warning_Level=0 All_Console=Off +W80 +H60 +oC:\Users\auris\Desktop\Informatics\7_semestras\Projektinis\Generated_Forests\Test\Spygliuociai\Ruduo\%%A DECLARE=seed_num=%%A DECLARE=season_num=1 DECLARE=forest_num=1
)
FOR /L %%A IN (3500, 1, 3600) DO (
  pvengine.exe /render lapuociai.pov -V -GD -GR -GW Warning_Level=0 All_Console=Off +W80 +H60 +oC:\Users\auris\Desktop\Informatics\7_semestras\Projektinis\Generated_Forests\Test\Spygliuociai\Ziema\%%A DECLARE=seed_num=%%A DECLARE=season_num=2 DECLARE=forest_num=1
)