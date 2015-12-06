 # Create a user agent object
  use LWP::UserAgent;
my $fh;
if(open($fh, "<words.txt"))
{
	while(<$fh>)
	{
		chomp $_;
		print "$_ \t";
		  
my $ua = LWP::UserAgent->new;
  $ua->agent("MyApp/0.1 ");

  # Create a request
  my $req = HTTP::Request->new(POST => "http://dictionary.imtranslator.net/english-russian-common-words-pro/$_/");
  $req->content_type('application/x-www-form-urlencoded');
  $req->content('query=libwww-perl&mode=dist');

  # Pass request to the user agent and get a response back
  my $res = $ua->request($req);

  # Check the outcome of the response
  if ($res->is_success) {
      #print $res->content;
	if($res->content =~ /transcription\"> \[(.*)\]<\/SPAN/)
	{print "$1\t";}
	else{print "error\n";}
  }
  else {
      print $res->status_line, "\n";
  }

  my $req = HTTP::Request->new(POST => "http://www.lingvo.ua/uk/Translate/en-uk/$_");
  $req->content_type('application/x-www-form-urlencoded');
  $req->content('query=libwww-perl&mode=dist');

  # Pass request to the user agent and get a response back
  my $res = $ua->request($req);

  # Check the outcome of the response
  if ($res->is_success) {
      #print $res->content;
	if($res->content =~ /translation\">(.*?)<\/span/)
	{print "$1\t";}
	elsif($res->content =~ /js-translation-text\">(.*?)<\/span/)
	{print "$1\t";}
	else {print "error\n";}
  }
  else {
      print $res->status_line, "\n";
  }
	print "\n";
	}
}
else
{
	print("erorr open file\n");
}




