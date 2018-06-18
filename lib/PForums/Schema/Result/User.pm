use utf8;
package PForums::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PForums::Schema::Result::User

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<Users>

=cut

__PACKAGE__->table("Users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 first_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 middle_name

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 last_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 25

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 new column name

  accessor: 'new_column_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "first_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "middle_name",
  { data_type => "varchar", is_nullable => 1, size => 25 },
  "last_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 25 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "password",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "new column name",
  {
    accessor => "new_column_name",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 replies

Type: has_many

Related object: L<PForums::Schema::Result::Reply>

=cut

__PACKAGE__->has_many(
  "replies",
  "PForums::Schema::Result::Reply",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 threads

Type: has_many

Related object: L<PForums::Schema::Result::Thread>

=cut

__PACKAGE__->has_many(
  "threads",
  "PForums::Schema::Result::Thread",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-06-16 15:41:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:m33BmnhrTOb1E8pDgGZD0Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
