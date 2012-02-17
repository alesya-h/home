#!/usr/bin/env perl
my $findargs;
my $template;

if(@ARGV == 2){
  $findargs = $ARGV[0];
  $template = $ARGV[1];
}elsif(@ARGV == 1){
  $findargs = '.';
  $template = $ARGV[0];
}else{
  die('Recursively search for substring in all files in directory.
Usage:
 $ find.pl <dir> <template>
    or
 $ find.pl <template> # search in current directory
');
}

my $divider_color   = "\033[41m";
my $filename_color  = "\033[1;35m";
my $line_num_color  = "\033[1;32m";
my $substring_color = "\033[4m";
my $no_color="\033[0m";

print "$divider_color".("x" x 80)."$no_color\n";

open(FILENAMES,"find $findargs |");

while(chomp($filename = <FILENAMES>)){
  if(-T $filename){
    open(FP,$filename) or die("Can't open file $filename");
    my $found = '';
    my $line_num = 0;
    while(<FP>){
      $line_num++;
      if(/$template/){
        unless($found){
          print "$filename_color$filename$no_color\n";
          $found=1;
        }
        my $line = $_;
        $line =~ s/^\s+//;
        $line =~ s/($template)/$substring_color$1$no_color/;
        printf("  $line_num_color%4d:$no_color $line",$line_num);
      }
    }
    close(FP);
  }
}
