#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file



jv_pg_ct_blague() {
varchemblague="$jv_dir/plugins/jarvis-blagues/toto.txt"

wget -q - http://humour-blague.com/blagues-2/index.php# -O $varchemblague

local ligne=$(sed -n "236p" $varchemblague)
local ligne1=$(sed -n "237p" $varchemblague)
local ligne2=$(sed -n "238p" $varchemblague)
local ligne3=$(sed -n "239p" $varchemblague)
local ligne4=$(sed -n "240p" $varchemblague)
local ligne5=$(sed -n "241p" $varchemblague)
local ligne6=$(sed -n "242p" $varchemblague)
local ligne7=$(sed -n "243p" $varchemblague)
local ligne8=$(sed -n "244p" $varchemblague)
local ligne9=$(sed -n "245p" $varchemblague)
local ligne10=$(sed -n "246p" $varchemblague)
local ligne11=$(sed -n "247p" $varchemblague)
local ligne12=$(sed -n "248p" $varchemblague)
local ligne13=$(sed -n "249p" $varchemblague)
local ligne15=$(sed -n "250p" $varchemblague)
local ligne16=$(sed -n "251p" $varchemblague)
local ligne17=$(sed -n "252p" $varchemblague)
local ligne18=$(sed -n "253p" $varchemblague)
local ligne19=$(sed -n "254p" $varchemblague)
local ligne20=$(sed -n "255p" $varchemblague)
local ligne22=$(sed -n "256p" $varchemblague)
local ligne23=$(sed -n "257p" $varchemblague)
local ligne24=$(sed -n "258p" $varchemblague)
local ligne25=$(sed -n "259p" $varchemblague)




  grep -q '<p' <<< "$ligne" && exitblaguesay && return || lignesay=$ligne && jv_pg_ct_blaguesay
 grep -q '<p' <<< "$ligne1" && exitblaguesay && return || lignesay=$ligne1 && jv_pg_ct_blaguesay
 grep -q '<p' <<< "$ligne2" && exitblaguesay && return || lignesay=$ligne2 && jv_pg_ct_blaguesay
 grep -q '<p' <<< "$ligne3" && exitblaguesay && return || lignesay=$ligne3 && jv_pg_ct_blaguesay
 grep -q '<p' <<< "$ligne4" && exitblaguesay && return || lignesay=$ligne4 && jv_pg_ct_blaguesay
 grep -q '<p' <<< "$ligne5" && exitblaguesay && return || lignesay=$ligne5 && jv_pg_ct_blaguesay
 grep -q '<p' <<< "$ligne6" && exitblaguesay && return || lignesay=$ligne6 && jv_pg_ct_blaguesay
 grep -q '<p' <<< "$ligne7" && exitblaguesay && return || lignesay=$ligne7 && jv_pg_ct_blaguesay
 grep -q '<p' <<< "$ligne8" && exitblaguesay && return || lignesay=$ligne8 && jv_pg_ct_blaguesay
 grep -q '<p' <<< "$ligne9" && exitblaguesay && return || lignesay=$ligne9 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne10" && exitblaguesay && return || lignesay=$ligne10 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne11" && exitblaguesay && return || lignesay=$ligne11 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne12" && exitblaguesay && return || lignesay=$ligne12 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne13" && exitblaguesay && return || lignesay=$ligne13 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne14" && exitblaguesay && return || lignesay=$ligne14 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne15" && exitblaguesay && return || lignesay=$ligne15 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne16" && exitblaguesay && return || lignesay=$ligne16 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne17" && exitblaguesay && return || lignesay=$ligne17 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne18" && exitblaguesay && return || lignesay=$ligne18 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne19" && exitblaguesay && return || lignesay=$ligne19 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne20" && exitblaguesay && return || lignesay=$ligne20 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne21" && exitblaguesay && return || lignesay=$ligne21 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne22" && exitblaguesay && return || lignesay=$ligne22 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne23" && exitblaguesay && return || lignesay=$ligne23 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne24" && exitblaguesay && return || lignesay=$ligne24 && jv_pg_ct_blaguesay
grep -q '<p' <<< "$ligne25" && exitblaguesay && return || lignesay=$ligne25 && jv_pg_ct_blaguesay




}


jv_pg_ct_blaguesay() {
direblaguesay=`echo $lignesay | sed -e "s/<.*/ /g" | sed -e "s/&quot;/ /g" | sed -e "s/&egrave;/è/g" | sed -e "s/&ucirc;/û/g" | sed -e "s/&eacute;/é/g" | sed -e "s/&Eacute;/é/g" | sed -e "s/&icirc;/î/g"  | sed -e "s/&agrave;/à/g" | sed -e "s/arr&ecirc;/ê/g" | sed -e "s/&ecirc;/ê/g" | sed -e "s/&#8217;/'/g" | sed -e "s/&ccedil;/ç/g" | sed -e "s/&Ccedil;/ç/g" | sed -e "s/&rsquo;/'/g" | sed -e "s/h&ocirc;/ô/g" | sed -e "s/&amp;/et/g"`
say "$direblaguesay"

if [[ "$lignesay" =~ "?" ]]; then 
	if [[ "$lignesay" =~ "quel" ]] || [[ "$lignesay" =~ "pourquoi" ]] || [[ "$lignesay" =~ "que" ]] || [[ "$lignesay" =~ "qu'est" ]]; then 
	mpg321 "$jv_dir/plugins/jarvis-blagues/sonnette.mp3" > /dev/null 2>&1

	sleep 4
	mpg321 "$jv_dir/plugins/jarvis-blagues/sonnette.mp3" > /dev/null 2>&1

	say "   "
	fi
fi

}


exitblaguesay () {
# echo ""
rm $varchemblague > /dev/null 2>&1
}
