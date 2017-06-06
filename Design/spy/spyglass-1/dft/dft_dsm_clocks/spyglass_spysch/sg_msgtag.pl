################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(65,32);
spyCacheTagValuesFromBatch(["DFT_DATA_CSV_TAG"]);
spyParseTextMessageTagFile("./spyglass-1/dft/dft_dsm_clocks/spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
,"TEMPLATE" => "A"
)
);
}
spyMessageTagTestBenchmark(167,"./spyglass-1/dft/dft_dsm_clocks/spyglass.vdb");

1;
