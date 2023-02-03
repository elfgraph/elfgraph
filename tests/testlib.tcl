source ../elfgraph

proc assert {cond} {
    set script [subst {
        if {$cond} {
        } else {
            return -code error {assertion: $cond}
        }
    }]

    uplevel $script
}

proc test {name args} {
    set name test_$name
    lappend ::tests $name
    proc $name {} {*}$args
}

proc run_tests {} {
    set rc 0

    foreach test $::tests {
        puts -nonewline stderr "$test... "
        try {
            $test
            puts "ok"
        } on error e {
            puts stderr "failed on $e"
            set rc 1
        }
    }

    exit $rc
}

proc filter {collection predicate} {
    lmap _ $collection {expr {[{*}$predicate $_] ? $_ : [continue]}}
}
