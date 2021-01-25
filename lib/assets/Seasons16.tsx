<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.4" tiledversion="1.4.3" name="Seasons16" tilewidth="16" tileheight="16" tilecount="340" columns="17">
 <image source="SeasonsTilesheet.png" trans="fd4dd3" width="272" height="320"/>
 <terraintypes>
  <terrain name="Spring" tile="0"/>
  <terrain name="Summer" tile="0"/>
  <terrain name="Fall" tile="0"/>
  <terrain name="Winter" tile="0"/>
  <terrain name="SpringPassable" tile="99"/>
  <terrain name="SummerPassable" tile="99"/>
  <terrain name="FallPassable" tile="99"/>
  <terrain name="WinterPassable" tile="99"/>
 </terraintypes>
 <tile id="12" type="coinp"/>
 <tile id="13" type="coing"/>
 <tile id="14" type="gem"/>
 <tile id="15" type="heart"/>
 <tile id="29" type="enemy">
  <properties>
   <property name="name" value="bat"/>
   <property name="verso" value="r"/>
  </properties>
 </tile>
 <tile id="30" type="enemy">
  <properties>
   <property name="ground?" type="bool" value="true"/>
   <property name="name" value="slime"/>
   <property name="verso" value="r"/>
  </properties>
 </tile>
 <tile id="31" type="enemy">
  <properties>
   <property name="name" value="ghost"/>
   <property name="verso" value="r"/>
  </properties>
 </tile>
 <tile id="32" type="enemy">
  <properties>
   <property name="ground?" type="bool" value="true"/>
   <property name="name" value="spider"/>
   <property name="verso" value="r"/>
  </properties>
 </tile>
 <tile id="46" type="enemy">
  <properties>
   <property name="name" value="bat"/>
   <property name="verso" value="l"/>
  </properties>
 </tile>
 <tile id="47" type="enemy">
  <properties>
   <property name="ground?" type="bool" value="true"/>
   <property name="name" value="slime"/>
   <property name="verso" value="l"/>
  </properties>
 </tile>
 <tile id="48" type="enemy">
  <properties>
   <property name="name" value="ghost"/>
   <property name="verso" value="l"/>
  </properties>
 </tile>
 <tile id="49" type="enemy">
  <properties>
   <property name="ground?" type="bool" value="true"/>
   <property name="name" value="spider"/>
   <property name="verso" value="l"/>
  </properties>
 </tile>
 <tile id="51" type="terrain" terrain=",,,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="52" type="terrain" terrain=",,0,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="53" type="terrain" terrain=",,0,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="54" type="terrain" terrain=",,,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="55" type="terrain" terrain=",,1,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="56" type="terrain" terrain=",,1,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="57" type="terrain" terrain=",,,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="58" type="terrain" terrain=",,2,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="59" type="terrain" terrain=",,2,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="60" type="terrain" terrain=",,,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="61" type="terrain" terrain=",,3,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="62" type="terrain" terrain=",,3,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="63" type="player"/>
 <tile id="64" type="objective"/>
 <tile id="65" type="block"/>
 <tile id="68" type="terrain" terrain=",0,,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="69" type="terrain" terrain="0,0,0,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="70" type="terrain" terrain="0,,0,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="71" type="terrain" terrain=",1,,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="72" type="terrain" terrain="1,1,1,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="73" type="terrain" terrain="1,,1,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="74" type="terrain" terrain=",2,,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="75" type="terrain" terrain="2,2,2,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="76" type="terrain" terrain="2,,2,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="77" type="terrain" terrain=",3,,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="78" type="terrain" terrain="3,3,3,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="79" type="terrain" terrain="3,,3,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="85" type="terrain" terrain=",0,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="86" type="terrain" terrain="0,0,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="87" type="terrain" terrain="0,,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="88" type="terrain" terrain=",1,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="89" type="terrain" terrain="1,1,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="90" type="terrain" terrain="1,,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="91" type="terrain" terrain=",2,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="92" type="terrain" terrain="2,2,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="93" type="terrain" terrain="2,,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="94" type="terrain" terrain=",3,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="95" type="terrain" terrain="3,3,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="96" type="terrain" terrain="3,,,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="102" type="terrain" terrain=",0,0,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="103" type="bumper"/>
 <tile id="104" type="terrain" terrain="0,,0,0">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="105" type="terrain" terrain=",1,1,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="106" type="spikes">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="107" type="terrain" terrain="1,,1,1">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="108" type="terrain" terrain=",2,2,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="110" type="terrain" terrain="2,,2,2">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="111" type="terrain" terrain=",3,3,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="113" type="terrain" terrain="3,,3,3">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="119" type="terrain" terrain=",,,4">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="120" type="terrain" terrain=",,4,4">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="121" type="terrain" terrain=",,4,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="122" type="terrain" terrain=",,,5">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="123" type="terrain" terrain=",,5,5">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="124" type="terrain" terrain=",,5,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="125" type="terrain" terrain=",,,6">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="126" type="terrain" terrain=",,6,6">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="127" type="terrain" terrain=",,6,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="128" type="terrain" terrain=",,,7">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="129" type="terrain" terrain=",,7,7">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="130" type="terrain" terrain=",,7,">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="136" type="terrain" terrain=",4,,4"/>
 <tile id="137" type="terrain" terrain="4,4,4,4"/>
 <tile id="138" type="terrain" terrain="4,,4,"/>
 <tile id="139" type="terrain" terrain=",5,,5"/>
 <tile id="140" type="terrain" terrain="5,5,5,5"/>
 <tile id="141" type="terrain" terrain="5,,5,"/>
 <tile id="142" type="terrain" terrain=",6,,6"/>
 <tile id="143" type="terrain" terrain="6,6,6,6"/>
 <tile id="144" type="terrain" terrain="6,,6,"/>
 <tile id="145" type="terrain" terrain=",7,,7"/>
 <tile id="146" type="terrain" terrain="7,7,7,7"/>
 <tile id="147" type="terrain" terrain="7,,7,"/>
 <tile id="153" type="terrain" terrain=",4,,"/>
 <tile id="154" type="terrain" terrain="4,4,,"/>
 <tile id="155" type="terrain" terrain="4,,,"/>
 <tile id="156" type="terrain" terrain=",5,,"/>
 <tile id="157" type="terrain" terrain="5,5,,"/>
 <tile id="158" type="terrain" terrain="5,,,"/>
 <tile id="159" type="terrain" terrain=",6,,"/>
 <tile id="160" type="terrain" terrain="6,6,,"/>
 <tile id="161" type="terrain" terrain="6,,,"/>
 <tile id="162" type="terrain" terrain=",7,,"/>
 <tile id="163" type="terrain" terrain="7,7,,"/>
 <tile id="164" type="terrain" terrain="7,,,"/>
 <tile id="170" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="171" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="172" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="173" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="174" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="175" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="176" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="177" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="178" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="179" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="180" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="181" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="187" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="188" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="189" type="platVert">
  <properties>
   <property name="passable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="190" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="193" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="196" type="terrain">
  <properties>
   <property name="collidable" type="bool" value="true"/>
  </properties>
 </tile>
 <tile id="204" type="platOriz">
  <properties>
   <property name="passable" type="bool" value="true"/>
  </properties>
 </tile>
</tileset>
