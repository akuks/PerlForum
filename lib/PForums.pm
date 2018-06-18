package PForums;
use Dancer2;
use Dancer2::Plugin::DBIC;
use strict;
use warnings;


our $VERSION = '0.1';

get '/' => sub {
    my @threads = schema->resultset('Thread')->all();

    template 'index' => {
        'title'   => 'PForums' ,
        'threads' => \@threads
    };
};

get '/hello' => sub {
    return "Welcome to Dancer2 Web Application";
};

true;
