#!/usr/bin/env perl
#
# This script adapts the ckan.po file to the I-lab catalog, by replacing
# references regarding "groups" with references to "collections". By default,
# we use it on the British English file (ckan/i18n/en_GB/LC_MESSAGES/ckan.po)
#
# Example command:
#
# ./adapt-translation.pl < ~/path/to/ckan-version/ckan/i18n/en_GB/LC_MESSAGES/ckan.po > roles/ckan/files/ckan.po
#
# Then use gettext to generate a message object file:
#
# msgfmt ckan.po -o ckan.mo
#

while (<>) {
  $l = $_;
  if ( $l !~ /^(msgid |msgid_plural |\#)/ and $l !~ /CKAN is used by governments and user groups/ ) {
    $l =~ s/groups/collections/g;
    $l =~ s/group^\/(?!\})/collection/g;
    $l =~ s/Groups/Collections/g;
    $l =~ s/Group/Collection/g;
    print $l;
  }
  else {
    print $l;
  }
}
