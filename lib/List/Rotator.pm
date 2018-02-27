package List::Rotator;

use strict;
use warnings FATAL => 'all';
use constant false => 0;
use constant true  => 1;

our $VERSION = '0.01';

sub new
{
    my ($class, $list, $rotation) = @_;

    $rotation = 1 if !defined($rotation);
    my $this = {
        list               => $list,
        list_length        => scalar(@{$list}),
        current_index      => 0,
        rotate_after       => $rotation ,
        counter            => 1
    };

    bless $this, $class;
    return $this;
}

sub rotate_after
{
    my ($this, $value) = @_;
    $this->{rotate_after} = $value if defined($value);
    return $this->{rotate_after};
}

sub rotate
{
    my $this =shift;

    if($this->{ counter } eq $this->{ rotate_after })
    {
        $this->{ current_index } += 1;
        $this->{ current_index }  = 0 if($this->{ current_index}  eq $this->{ list_length });
        $this->{ counter } = 0;
    }

    $this->{ counter } += 1;
    return $this->{ counter };
}

sub set_current
{
    my ($this,$value);
    @{$this->{ list }}[$this->{ current_index }] = $value;
}

sub append_current
{
    my ($this,$value);
    @{$this->{ list }}[$this->{ current_index }] .= $value;
}

sub current
{
    my  ($this) = @_;
    return '' if($this->{list_length} == 0);
    return @{$this->{list}}[$this->{current_index}];
}

sub set_current_index
{
    my ($this, $index) = @_;
    $this->{current_index} = $index;
}

sub get_current_index
{
    my $this = $_[0];
    return $this->{current_index};
}

=head1 AUTHOR

Larbi Benjelloun, C<< <reganova\ at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-list-rotator at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=List-Rotator>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc List::Rotator


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=List-Rotator>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/List-Rotator>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/List-Rotator>

=item * Search CPAN

L<http://search.cpan.org/dist/List-Rotator/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2018 Larbi Benjelloun.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of List::Rotator
