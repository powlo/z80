# this script copies a file from one directory, converts it to the new format
# and then compiles and links it.
use strict;
use warnings;


my $array_pak = "..\\source\\instruction_array_pak_e.vhdl";
my $array_list = "..\\source\\instruction_list_pak_e.vhdl";
my $dumplist_file = "list.txt";
my $dumppak_file = "pak.txt";
my $target_type = "T_INSTRUCTION";
my $constant_array = "K_Instruction_Array";
my $type_array = "T_Instruction_Array";
my @list_array;
my $list_scalar;
my @pak_array;
my $pak_scalar;
my @lines;
my $thisline;

open(PAKHANDLE, "$array_pak")
  || die("Cannot Open source file $array_pak");  # Open the pak
open(LISTHANDLE, "$array_list")
  || die("Cannot Open source file $array_list");		# Open the list
open (DUMPLIST, ">$dumplist_file")
  || die("Cannot Open source file $dumplist_file");		# Open file for writing

open (DUMPPAK, ">$dumppak_file")
  || die("Cannot Open source file $dumppak_file");		# Open file for writing

@list_array = <LISTHANDLE>;		# Read it into an scalar
$list_scalar = join ("", @list_array);

#if ($file =~ /"type\s+$target_type\s+is\s*\("/i ) {

if ($list_scalar =~ /type\s+$target_type\s+is\s*\((.*?)\);/is ) {

  $list_scalar = $1;            # pick up the contents of the type we just searched for
  $list_scalar =~ s/--.*\n//g;  # remove comments
  $list_scalar =~ s/\s//mg;     # remove white space

  @list_array = split (/,/,$list_scalar); #build an array from contents
  @list_array = sort (@list_array); # sort the array
  $list_scalar = join ("\n", @list_array); # put the sorted info back in the scalar
}

else {
  print "target array $target_type not found in list file!\n";
}

@pak_array = <PAKHANDLE>;		# Read it into an scalar
$pak_scalar = join ("", @pak_array);

#constant K_Instruction_Array : T_Instruction_Array := (

if ($pak_scalar =~ /constant\s+$constant_array\s+:\s+$type_array\s*:=\s*\((.*?)\);/is ) {

  $pak_scalar = $1;            # pick up the contents of the type we just searched for
  $pak_scalar =~ s/--.*\n//g;  # remove comments
  $pak_scalar =~ s/=>\s*\(.*\)//mg; # remove assignments
  $pak_scalar =~ s/\s//mg;     # remove white space

  @pak_array = split (/,/,$pak_scalar); #build an array from contents
  @pak_array = sort (@pak_array); # sort the array
  $pak_scalar = join ("\n", @pak_array); # put the sorted info back in the scalar
}

else {
  print "target array $target_type not found in pak\n";
}

print DUMPPAK $pak_scalar;
print DUMPLIST $list_scalar;

# now search for each item in each array
# this use of if is a fudge, work out how "!" works!
foreach (@pak_array) {
  if ($list_scalar =~ /$_/i) { }
  else {
    print "$_ not found in list array!\n";
    }
  }
foreach (@list_array) {
  if ($pak_scalar =~ /$_/i) { }
  else {
    print "$_ not found in pak array!\n";
    }
  }
