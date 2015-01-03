# this script copies a file from one directory, converts it to the new format
# and then compiles and links it.
use strict;
use warnings;

my $convert_script = "z80asm2asmz80.pl";
my $compiler = "asz80.exe";
my $compiler_params = "-l";
my $compiler_result_extention = ".rel";
my $linker = "aslink.exe";
my $base = "..\\test\\";
my $sourcepath = "i8080\\";
my $targetpath = "z80\\";
my $testname;
my $asm = ".asm";
my @lines;
my $thisline;

if ($#ARGV != 1) {
  print "Enter a test to convert:\n";
  $testname = <STDIN>;
  chomp ($testname);
}
else {
  $testname = $ARGV[0];
}
#generate the new assembler code:

open(SOURCEHANDLE, "$base$sourcepath$testname$asm")
  || die("Cannot Open source file $base$sourcepath$testname$asm");  # Open the source
open(TARGETHANDLE, ">$base$targetpath$testname$asm")
  || die("Cannot Open source file $base$targetpath$testname$asm");		# Open the target
@lines = <SOURCEHANDLE>;		# Read it into an array
foreach $thisline (@lines)
{
$thisline =~ s/(\s+)z80(\s+)/$1.area	CODE (ABS)$2/; #replace each of the
$thisline =~ s/&H/#0H/;                              #old assembler instructions
$thisline =~ s/(\s+)org(\s+)/$1.org$2/;              #with its new equivalent.
$thisline =~ s/(\s+)mvi(\s+)/$1ld$2/;
$thisline =~ s/(\s+)cmpi(\s+)/$1cp$2/;
$thisline =~ s/(\s+)ani(\s+)/$1and$2/;
$thisline =~ s/(\s+)m(\s+|,\s*)/$1(hl)$2/;
$thisline =~ s/(\s+)jp(\s+)/$1jp\tp,$2/;
$thisline =~ s/(\s+)jnz(\s+)/$1jp\tnz,$2/;
$thisline =~ s/(\s+)jz(\s+)/$1jp\tz,$2/;
$thisline =~ s/(\s+)jnc(\s+)/$1jp\tnc,$2/;
$thisline =~ s/(\s+)jc(\s+)/$1jp\tc,$2/;
$thisline =~ s/(\s+)jpo(\s+)/$1jp\tpo,$2/;
$thisline =~ s/(\s+)jpe(\s+)/$1jp\tpe,$2/;
$thisline =~ s/(\s+)jm(\s+)/$1jp\tm,$2/;
$thisline =~ s/(\s+)jmp(\s+)/$1jp\t$2/;
$thisline =~ s/(\s+)adi(\s+)/$1add$2/;
$thisline =~ s/(\s+)aci(\s+)/$1adc$2/;
$thisline =~ s/(\s+)sbb(\s+)/$1sbc$2/;
$thisline =~ s/(\s+)sbi(\s+)/$1sbc$2/;
$thisline =~ s/(\s+)sui(\s+)/$1sub$2/;
$thisline =~ s/(\s+)ana(\s+)/$1and$2/;
$thisline =~ s/(\s+)ani(\s+)/$1and$2/;
$thisline =~ s/(\s+)ora(\s+)/$1or$2/;
$thisline =~ s/(\s+)ori(\s+)/$1or$2/;
$thisline =~ s/(\s+)xra(\s+)/$1xor$2/;
$thisline =~ s/(\s+)xri(\s+)/$1xor$2/;
$thisline =~ s/(\s+)sta\s+(#0H\d{4})\s*\n/$1ld\t\($2\),a\n/;
$thisline =~ s/\A(\w+)(\s*\Z)/$1:$2/;

print TARGETHANDLE $thisline;
}
close(SOURCEHANDLE);			# Close the source file
close(TARGETHANDLE);			# Close the target file


#compile the new code:
system ($compiler, $compiler_params, "$base$targetpath$testname.asm");

#link the new code:
#system {$linker,

