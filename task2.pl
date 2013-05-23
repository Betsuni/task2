$j = 0;
for($i = 0; $i < @ARGV; $i++)
{
	if($ARGV[$i] =~ m/.+\.txt/i)
	{
		open (F, "< $ARGV[$i]") or print "$!"."\n";
		@FILE = stat(F);
		$size = $FILE[7];
		if($size < 1048576)
		{
			$sizes += $size;
			if($sizes < 5242880)
			{
				@FILE_2 = <F>;
				$str = join(//, @FILE_2);
				@buf = split(' ',$str);
				for($k = 0; $k < @buf; $k++)
				{
					unless($buf[$k] =~ m/[^\d]/i)
					{
						$out[$j++] =  $buf[$k];
					}
				}
			}
			else
			{
				print"Size all file very big!"."\n";
			}
		}
		else
		{
			print "Wrong file size!"."\n";
		}
	}
	else
	{
		print "Not txt-file!"."\n";
	}
}

@out = sort{$a <=> $b} @out;
print join(" ", @out);

 