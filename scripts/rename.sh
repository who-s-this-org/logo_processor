rename '
  s/_(result|trimmed|extended|processed|part_|Copy)//ig;
  s/\s+\(\d\)//ig;
  s/^(Screenshot_|SCR-)//ig;
  s/_\d+_\d+\./\./ig;
  s/[\(\) ]/_/ig;
  s/__+/_/ig;
  s/_\d?\././ig;
  s/^_+//ig;
' -- *
