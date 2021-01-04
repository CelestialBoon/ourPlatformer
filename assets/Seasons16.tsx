<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.4" tiledversion="1.4.3" name="Seasons16" tilewidth="16" tileheight="16" tilecount="400" columns="20">
 <image source="SeasonsTilesheet.png" trans="fd4dd3" width="320" height="320"/>
 <terraintypes>
  <terrain name="Spring" tile="0"/>
  <terrain name="Summer" tile="0"/>
  <terrain name="Fall" tile="0"/>
  <terrain name="Winter" tile="0"/>
  <terrain name="SpringPassable" tile="114"/>
  <terrain name="SummerPassable" tile="114"/>
  <terrain name="FallPassable" tile="114"/>
  <terrain name="WinterPassable" tile="114"/>
 </terraintypes>
 <tile id="2" type="passable">
  <properties>
   <property name="collidable" type="bool" value="true"/>
   <property name="passable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="12" type="coinp"/>
 <tile id="13" type="coing"/>
 <tile id="14" type="gem"/>
 <tile id="15" type="heart"/>
 <tile id="32" type="enemy">
  <properties>
   <property name="name" value="bat"/>
   <property name="verso" value="r"/>
  </properties>
 </tile>
 <tile id="33" type="enemy">
  <properties>
   <property name="ground?" type="bool" value="true"/>
   <property name="name" value="slime"/>
   <property name="verso" value="r"/>
  </properties>
 </tile>
 <tile id="34" type="enemy">
  <properties>
   <property name="name" value="ghost"/>
   <property name="verso" value="r"/>
  </properties>
 </tile>
 <tile id="35" type="enemy">
  <properties>
   <property name="ground?" type="bool" value="true"/>
   <property name="name" value="spider"/>
   <property name="verso" value="r"/>
  </properties>
 </tile>
 <tile id="36" type="terrain"/>
 <tile id="37" type="terrain"/>
 <tile id="38" type="terrain"/>
 <tile id="39" type="terrain"/>
 <tile id="40" type="terrain"/>
 <tile id="41" type="terrain"/>
 <tile id="42" type="terrain"/>
 <tile id="43" type="terrain"/>
 <tile id="44" type="terrain"/>
 <tile id="45" type="terrain"/>
 <tile id="46" type="terrain"/>
 <tile id="47" type="terrain"/>
 <tile id="48" type="terrain"/>
 <tile id="49" type="terrain"/>
 <tile id="50" type="terrain"/>
 <tile id="51" type="terrain"/>
 <tile id="52" type="enemy">
  <properties>
   <property name="name" value="bat"/>
   <property name="verso" value="l"/>
  </properties>
 </tile>
 <tile id="53" type="enemy">
  <properties>
   <property name="ground?" type="bool" value="true"/>
   <property name="name" value="slime"/>
   <property name="verso" value="l"/>
  </properties>
 </tile>
 <tile id="54" type="enemy">
  <properties>
   <property name="name" value="ghost"/>
   <property name="verso" value="l"/>
  </properties>
 </tile>
 <tile id="55" type="enemy">
  <properties>
   <property name="ground?" type="bool" value="true"/>
   <property name="name" value="spider"/>
   <property name="verso" value="l"/>
  </properties>
 </tile>
 <tile id="56" type="terrain"/>
 <tile id="57" type="terrain"/>
 <tile id="58" type="terrain"/>
 <tile id="59" type="terrain"/>
 <tile id="60" type="terrain" terrain=",,,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="61" type="terrain" terrain=",,0,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="62" type="terrain" terrain=",,0,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="63" type="terrain" terrain=",,,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="64" type="terrain" terrain=",,1,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="65" type="terrain" terrain=",,1,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="66" type="terrain" terrain=",,,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="67" type="terrain" terrain=",,2,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="68" type="terrain" terrain=",,2,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="69" type="terrain" terrain=",,,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="70" type="terrain" terrain=",,3,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="71" type="terrain" terrain=",,3,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="72" type="player"/>
 <tile id="73" type="objective"/>
 <tile id="74" type="block"/>
 <tile id="80" type="terrain" terrain=",0,,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="81" type="terrain" terrain="0,0,0,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="82" type="terrain" terrain="0,,0,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="83" type="terrain" terrain=",1,,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="84" type="terrain" terrain="1,1,1,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="85" type="terrain" terrain="1,,1,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="86" type="terrain" terrain=",2,,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="87" type="terrain" terrain="2,2,2,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="88" type="terrain" terrain="2,,2,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="89" type="terrain" terrain=",3,,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="90" type="terrain" terrain="3,3,3,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="91" type="terrain" terrain="3,,3,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="100" type="terrain" terrain=",0,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="101" type="terrain" terrain="0,0,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="102" type="terrain" terrain="0,,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="103" type="terrain" terrain=",1,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="104" type="terrain" terrain="1,1,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="105" type="terrain" terrain="1,,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="106" type="terrain" terrain=",2,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="107" type="terrain" terrain="2,2,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="108" type="terrain" terrain="2,,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="109" type="terrain" terrain=",3,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="110" type="terrain" terrain="3,3,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="111" type="terrain" terrain="3,,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="120" type="terrain" terrain=",0,0,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="121" type="bumper"/>
 <tile id="122" type="terrain" terrain="0,,0,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="123" type="terrain" terrain=",1,1,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="125" type="terrain" terrain="1,,1,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="126" type="terrain" terrain=",2,2,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="128" type="terrain" terrain="2,,2,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="129" type="terrain" terrain=",3,3,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="131" type="terrain" terrain="3,,3,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="140" type="terrain" terrain=",,,4">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="141" type="terrain" terrain=",,4,4">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="142" type="terrain" terrain=",,4,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="143" type="terrain" terrain=",,,5">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="144" type="terrain" terrain=",,5,5">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="145" type="terrain" terrain=",,5,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="146" type="terrain" terrain=",,,6">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="147" type="terrain" terrain=",,6,6">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="148" type="terrain" terrain=",,6,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="149" type="terrain" terrain=",,,7">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="150" type="terrain" terrain=",,7,7">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="151" type="terrain" terrain=",,7,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="160" type="terrain" terrain=",4,,4"/>
 <tile id="161" type="terrain" terrain="4,4,4,4"/>
 <tile id="162" type="terrain" terrain="4,,4,"/>
 <tile id="163" type="terrain" terrain=",5,,5"/>
 <tile id="164" type="terrain" terrain="5,5,5,5"/>
 <tile id="165" type="terrain" terrain="5,,5,"/>
 <tile id="166" type="terrain" terrain=",6,,6"/>
 <tile id="167" type="terrain" terrain="6,6,6,6"/>
 <tile id="168" type="terrain" terrain="6,,6,"/>
 <tile id="169" type="terrain" terrain=",7,,7"/>
 <tile id="170" type="terrain" terrain="7,7,7,7"/>
 <tile id="171" type="terrain" terrain="7,,7,"/>
 <tile id="180" type="terrain" terrain=",4,,"/>
 <tile id="181" type="terrain" terrain="4,4,,"/>
 <tile id="182" type="terrain" terrain="4,,,"/>
 <tile id="183" type="terrain" terrain=",5,,"/>
 <tile id="184" type="terrain" terrain="5,5,,"/>
 <tile id="185" type="terrain" terrain="5,,,"/>
 <tile id="186" type="terrain" terrain=",6,,"/>
 <tile id="187" type="terrain" terrain="6,6,,"/>
 <tile id="188" type="terrain" terrain="6,,,"/>
 <tile id="189" type="terrain" terrain=",7,,"/>
 <tile id="190" type="terrain" terrain="7,7,,"/>
 <tile id="191" type="terrain" terrain="7,,,"/>
 <tile id="200" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="201" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="202" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="203" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="204" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="205" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="206" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="207" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="208" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="209" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="210" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="211" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
</tileset>
