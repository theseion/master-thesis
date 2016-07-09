running
run
    | timesSmall counter timesLarge withGCSmall withoutGCSmall withGCLarge withoutGCLarge |
    timesSmall := OrderedCollection new.
    timesLarge := OrderedCollection new.

    1000 timesRepeat: [
        Smalltalk garbageCollect.
        counter := 0.
        StackCopyBenchmark
            runSmallWith: counter
            collectingTimesInto: timesSmall.
    
        Smalltalk garbageCollect.
        counter := 0.
        StackCopyBenchmark
            runLargeWith: counter
            collectingTimesInto: timesLarge ].

    withGCSmall := timesSmall collect: #key.
    withoutGCSmall := timesSmall collect: #value.
    withGCLarge := timesLarge collect: #key.
    withoutGCLarge := timesLarge collect: #value.

    Transcript
        clear;
        open;
        show: 'small + GC max: ';
        show: withGCSmall max; cr;
        show: 'small + GC average: ';
        show: withGCSmall average asFloat; cr;
        show: 'small + GC median: ';
        show: withGCSmall median; cr; cr;
        show: 'small - GC max: ';
        show: withoutGCSmall max; cr;
        show: 'small - GC average: ';
        show: withoutGCSmall average asFloat; cr;
        show: 'small - GC median: ';
        show: withoutGCSmall median; cr; cr; cr;
    
        show: 'large + GC max: ';
        show: withGCLarge max; cr;
        show: 'large + GC average: ';
        show: withGCLarge average asFloat; cr;
        show: 'large + GC median: ';
        show: withGCLarge median; cr; cr;
        show: 'large - GC max: ';
        show: withoutGCLarge max; cr;
        show: 'large - GC average: ';
        show: withoutGCLarge average asFloat; cr;
        show: 'large - GC median: ';
        show: withoutGCLarge median; cr