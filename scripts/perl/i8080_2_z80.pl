# this is a simple script to convert i8080 assembler to the
# z80 format used by asmz80.
use strict;
use warnings;

my $sourcefilename;
my $targetfilename;
my $sourcepath = "..\\test\\i8080\\";
my $targetpath = "..\\test\\z80\\";
my @lines;
my $thisline;

if ($#ARGV != 2) {
  print "Enter a test to convert: ";
  chomp ($sourcefilename = <STDIN>);
  print "Enter the target test name: ";
  chomp ($targetfilename = <STDIN>);
}
else {
  $sourcefilename = $ARGV[0];		    # Name the source file
  $targetfilename = $ARGV[1];		    # Name the target file
}

open(SOURCEHANDLE, "$sourcepath$sourcefilename")
  || die("Cannot Open source file $sourcepath$sourcefilename");  # Open the source
open(TARGETHANDLE, ">$targetpath$targetfilename")
  || die("Cannot Open source file $targetpath$targetfilename");		# Open the target
@lines = <SOURCEHANDLE>;		# Read it into an array
foreach $thisline (@lines)
{
$thisline =~ s/(\s+)z80(\s+)/$1.area	CODE (ABS)$2/; #replace each of the
$thisline =~ s/&H/#0H/;                              #old assembler instructions
$thisline =~ s/(\s+)org(\s+)/$1.org$2/;              #with its new equivalent.
$thisline =~ s/(\s+)mvi(\s+)/$1ld$2/;
$thisline =~ s/(\s+)mov(\s+)/$1ld$2/;
$thisline =~ s/(\s+)lxi(\s+)/$1ld$2/;
$thisline =~ s/(\s+)sphl(\s+)/$1ld\tsp,hl$2/;
$thisline =~ s/(\s+)cmpi(\s+)/$1cp$2/;
$thisline =~ s/(\s+)cmp(\s+)/$1cp$2/;
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
$thisline =~ s/(\s+)inr(\s+)/$1inc$2/;
$thisline =~ s/(\s+)dcr(\s+)/$1dec$2/;
$thisline =~ s/(\s+)adi(\s+)/$1add$2/;
$thisline =~ s/(\s+)aci(\s+)/$1adc$2/;
$thisline =~ s/(\s+)dad(\s+)/$1add\thl,$2/;
$thisline =~ s/(\s+)dadx(\s+)/$1add\tix,$2/;
$thisline =~ s/(\s+)dady(\s+)/$1add\tiy,$2/;

#exchange instructions
$thisline =~ s/(\s+)xtix(\s+)/$1ex\t(sp),ix$2/;
$thisline =~ s/(\s+)xtiy(\s+)/$1ex\t(sp),iy$2/;
$thisline =~ s/(\s+)xthl(\s+)/$1ex\t(sp),hl$2/;
$thisline =~ s/(\s+)exaf(\s+)/$1ex\taf,af$2/;
$thisline =~ s/(\s+)xchg(\s+)/$1ex\tde,hl$2/;

#Arithmetic logic instructions
$thisline =~ s/(\s+)bset(\s+)/$1set$2/;
$thisline =~ s/(\s+)bset(\s+)/$1set$2/;

#Arithmetic logic instructions
$thisline =~ s/(\s+)cma(\s+)/$1cpl$2/;
$thisline =~ s/(\s+)stc(\s+)/$1scf$2/;
$thisline =~ s/(\s+)cmc(\s+)/$1ccf$2/;

$thisline =~ s/(\s+)sbb(\s+)/$1sbc$2/;
$thisline =~ s/(\s+)sbi(\s+)/$1sbc$2/;
$thisline =~ s/(\s+)sui(\s+)/$1sub$2/;
$thisline =~ s/(\s+)ana(\s+)/$1and$2/;
$thisline =~ s/(\s+)ani(\s+)/$1and$2/;
$thisline =~ s/(\s+)ora(\s+)/$1or$2/;
$thisline =~ s/(\s+)ori(\s+)/$1or$2/;
$thisline =~ s/(\s+)xra(\s+)/$1xor$2/;
$thisline =~ s/(\s+)xri(\s+)/$1xor$2/;

#rotate and shift
$thisline =~ s/(\s+)rlc(\s+)/$1rlca$2/;
$thisline =~ s/(\s+)rla(\s+)/$1rla$2/;
$thisline =~ s/(\s+)rrc(\s+)/$1rrca$2/;
$thisline =~ s/(\s+)rra(\s+)/$1rra$2/;

$thisline =~ s/(\s+)rlcr(\s+)/$1rlc$2/;
$thisline =~ s/(\s+)rlar(\s+)/$1rl$2/;
$thisline =~ s/(\s+)rrcr(\s+)/$1rrc$2/;
$thisline =~ s/(\s+)rrar(\s+)/$1rr$2/;

$thisline =~ s/(\s+)slar(\s+)/$1sla$2/;
$thisline =~ s/(\s+)srlr(\s+)/$1srl$2/;
$thisline =~ s/(\s+)srar(\s+)/$1sra$2/;

$thisline =~ s/(\s+)shld\s+(#0H\d{4})\s*/$1ld\t\($2\),hl/;
$thisline =~ s/(\s+)lhld\s+(#0H\d{4})\s*/$1ld\thl,($2\)/;
$thisline =~ s/(\s+)sixd\s+(#0H\d{4})\s*/$1ld\t\($2\),ix/;
$thisline =~ s/(\s+)lixd\s+(#0H\d{4})\s*/$1ld\tix,($2\)/;
$thisline =~ s/(\s+)siyd\s+(#0H\d{4})\s*/$1ld\t\($2\),iy/;
$thisline =~ s/(\s+)liyd\s+(#0H\d{4})\s*/$1ld\tiy,($2\)/;
$thisline =~ s/(\s+)lda\s+(#0H\d{4})\s*/$1ld\t\a,($2\)/;
$thisline =~ s/(\s+)sta\s+(#0H\d{4})\s*/$1ld\t\($2\),a/;
$thisline =~ s/\A(\w+)(\s*\Z)/$1:$2/;

#Replace ,m with ,(hl)
$thisline =~ s/,\s*m/,(hl)/;
print TARGETHANDLE $thisline;
}
close(SOURCEHANDLE);			# Close the source file
close(TARGETHANDLE);			# Close the target file

