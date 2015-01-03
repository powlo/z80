# this script copies a file from one directory, converts it to the new format
# and then compiles and links it.
use strict;
use warnings;

my $convert_script = "z80asm2asmz80.pl";
my $compiler = "asz80.exe";
my $compiler_params = "-l";
my $compiler_result_extention = ".rel";
my $linker = "aslink.exe";
my $base = "C:\\Projects\\Z80\\test\\asm\\";
my $sourcepath = "i8080\\";
my $targetpath = "asz80\\";
my $testname;
my $asm = ".asm";

if ($#ARGV != 1) {
  print "Enter a test to compile:\n";
  $testname = <STDIN>;
  chomp ($testname);
}
else {
  $testname = $ARGV[0];
}

#compile the new code:
system ($compiler, $compiler_params, "$base$targetpath$testname.asm");

