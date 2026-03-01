rename 's/_(result|trimmed|extended|processed|part_)//ig' -- *
rename 's/\s+\(\d\)//ig' -- *
rename 's/_\././ig' -- *
rename 's/_\d\././ig' -- *
rename 's/^Screenshot_//ig' -- *
rename 's/^SCR-//ig' -- *
rename 's/__+/_/ig' -- *
rename 's/_Copy_/_/ig' -- *
rename 's/[\(\) ]/_/ig' -- *
rename 's/^_+//ig' -- *
rename 's/_\d+_\d+\./\./ig' -- *
