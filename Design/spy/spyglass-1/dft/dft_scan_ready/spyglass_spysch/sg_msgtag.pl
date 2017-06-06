################################################################################
#This is an internally genertaed by SpyGlass for Message Tagging Support
################################################################################


use spyglass;
use SpyGlass;
use SpyGlass::Objects;
spyRebootMsgTagSupport();

spySetMsgTagCount(47,32);
spyCacheTagValuesFromBatch(["Clock_11_CSV_TAG"]);
spyCacheTagValuesFromBatch(["Clock_11_capture_CSV_TAG"]);
spyCacheTagValuesFromBatch(["DFT_DATA_CSV_TAG"]);
spyParseTextMessageTagFile("./spyglass-1/dft/dft_scan_ready/spyglass_spysch/sg_msgtag.txt");

if(!defined $::spyInIspy || !$::spyInIspy)
{
    spyDefineReportGroupingOrder("ALL",
(
"BUILTIN"   => [SGTAGTRUE, SGTAGFALSE]
,"TEMPLATE" => "A"
)
);
}
spyMessageTagTestBenchmark(206,"./spyglass-1/dft/dft_scan_ready/spyglass.vdb");

1;
