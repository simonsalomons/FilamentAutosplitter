// Known issues:
// - Load removal doesn't work when resetting a level due to the nrOfBots resetting to 0 between resets of a level.
//   NrOfBots is used to determine wether or not the player is inside an anchor.
//   When exiting an anchor, load removal should not happen.
//   (The game does load something, but the player can move)

state("Filament-Win64-Shipping", "v1.0") {
    // The id of the current anchor. Changes when entering an anchor
    uint currentAnchor: 0x02FD5080, 0x48, 0x630, 0x990, 0x248, 0x2F4;
    // The current puzzle in the active anchor. 0 = first puzzle, nrOfPuzzlesInAnchor = last puzzle completed
    uint currentPuzzleInAnchor: 0x0340F708, 0x8, 0x1C8, 0x230, 0x18, 0x1A0;
    // The total number of puzzles in an anchor. Changes when entering an anchor
    uint nrOfPuzzlesInAnchor: 0x0340F708, 0x8, 0x1A8, 0x2DC;
    // The number of completed puzzles in an anchor. Changes when solving a puzzle and when going to another anchor.
    uint nrOfCompletedPuzzlesInAnchor: 0x0340F708, 0x8, 0x1C8, 0x20, 0x248, 0x2D8;
    // Loading a level, 0 when not loading, "something else" when loading
    uint loadingLevel: 0x0340F708, 0x8, 0x180, 0x10, 0x1C8, 0xA0, 0x40, 0x264;
    // Loading a save file or the cockpit. 1 when loading, 0 when not loading
    uint loadingBig: 0x03328938, 0x28, 0x18, 0xA8;
    // Number of bots on screen
    uint nrOfBots: 0x03410660, 0x8, 0x8, 0x20, 0x28, 0x48, 0x28;
}

init {
}

update {
}

startup {
    settings.Add("splitOnAnchorComplete", true, "Split on anchor completion");
    settings.SetToolTip("splitOnAnchorComplete", "Splits every time you complete an anchor. Even when you have solved it before.");
    
    settings.Add("splitOnPuzzleComplete", true, "Split on puzzle completion");
    settings.SetToolTip("splitOnPuzzleComplete", "Splits every time you complete a puzzle. Even when you have solved it before.");

    settings.Add("splitOnlyUnsolved", false, "Split only when unsolved before");
    settings.SetToolTip("splitOnlyUnsolved", "Splits a puzzle/anchor completion only if it was unsolved before.");

    settings.Add("splitOnSpecificAnchors", false, "Split only on specific anchors");
    settings.SetToolTip("splitOnSpecificAnchors", "Splits only on the selected anchors.");

    settings.Add("anchor0", false, "Intro 1", "splitOnSpecificAnchors");
    settings.Add("anchor1", false, "Intro 2", "splitOnSpecificAnchors");
    settings.Add("anchor2", false, "Intro 3", "splitOnSpecificAnchors");
    settings.Add("anchor3", false, "Regular 1", "splitOnSpecificAnchors");
    settings.Add("anchor4", false, "Regular 2", "splitOnSpecificAnchors");
    settings.Add("anchor5", false, "Negative 1", "splitOnSpecificAnchors");
    settings.Add("anchor6", false, "Negative 2", "splitOnSpecificAnchors");
    settings.Add("anchor68", false, "Negative 3", "splitOnSpecificAnchors");
    settings.Add("anchor14", false, "Pair 1", "splitOnSpecificAnchors");
    settings.Add("anchor15", false, "Pair 2", "splitOnSpecificAnchors");
    settings.Add("anchor16", false, "Pair 3", "splitOnSpecificAnchors");
    settings.Add("anchor18", false, "Requisite 1", "splitOnSpecificAnchors");
    settings.Add("anchor19", false, "Requisite 2", "splitOnSpecificAnchors");
    settings.Add("anchor69", false, "Requisite 3", "splitOnSpecificAnchors");
    settings.Add("anchor73", false, "Jigsaw 1", "splitOnSpecificAnchors");
    settings.Add("anchor74", false, "Jigsaw 2", "splitOnSpecificAnchors");
    settings.Add("anchor75", false, "Jigsaw 3", "splitOnSpecificAnchors");
    settings.Add("anchor9", false, "Multi 1", "splitOnSpecificAnchors");
    settings.Add("anchor10", false, "Multi 2", "splitOnSpecificAnchors");
    settings.Add("anchor67", false, "Multi 3", "splitOnSpecificAnchors");
    settings.Add("anchor20", false, "Wrapping 1", "splitOnSpecificAnchors");
    settings.Add("anchor21", false, "Wrapping 2", "splitOnSpecificAnchors");
    settings.Add("anchor22", false, "Wrapping 3", "splitOnSpecificAnchors");
    settings.Add("anchor23", false, "Arch 1", "splitOnSpecificAnchors");
    settings.Add("anchor24", false, "Arch 2", "splitOnSpecificAnchors");
    settings.Add("anchor25", false, "Arch 3", "splitOnSpecificAnchors");
    settings.Add("anchor26", false, "Screen 1", "splitOnSpecificAnchors");
    settings.Add("anchor27", false, "Screen 2", "splitOnSpecificAnchors");
    settings.Add("anchor28", false, "Screen 3", "splitOnSpecificAnchors");
    settings.Add("anchor32", false, "Constellation 1", "splitOnSpecificAnchors");
    settings.Add("anchor33", false, "Constellation 2", "splitOnSpecificAnchors");
    settings.Add("anchor34", false, "Constellation 3", "splitOnSpecificAnchors");
    settings.Add("anchor7", false, "Mixing 1", "splitOnSpecificAnchors");
    settings.Add("anchor8", false, "Mixing 2", "splitOnSpecificAnchors");
    settings.Add("anchor72", false, "Mixing 3", "splitOnSpecificAnchors");
    settings.Add("anchor11", false, "Pad 1", "splitOnSpecificAnchors");
    settings.Add("anchor12", false, "Pad 2", "splitOnSpecificAnchors");
    settings.Add("anchor13", false, "Pad 3", "splitOnSpecificAnchors");
    settings.Add("anchor29", false, "Binary 1", "splitOnSpecificAnchors");
    settings.Add("anchor30", false, "Binary 2", "splitOnSpecificAnchors");
    settings.Add("anchor31", false, "Binary 3", "splitOnSpecificAnchors");
    settings.Add("anchor35", false, "Builder", "splitOnSpecificAnchors");
    settings.Add("anchor42", false, "Balance 1", "splitOnSpecificAnchors");
    settings.Add("anchor43", false, "Balance 2", "splitOnSpecificAnchors");
    settings.Add("anchor44", false, "Balance 3", "splitOnSpecificAnchors");
    settings.Add("anchor36", false, "Height 1", "splitOnSpecificAnchors");
    settings.Add("anchor37", false, "Height 2", "splitOnSpecificAnchors");
    settings.Add("anchor38", false, "Height 3", "splitOnSpecificAnchors");
    settings.Add("anchor39", false, "Height 4", "splitOnSpecificAnchors");
    settings.Add("anchor40", false, "Height 5", "splitOnSpecificAnchors");
    settings.Add("anchor41", false, "Height 6", "splitOnSpecificAnchors");
    settings.Add("anchor76", false, "Airlock", "splitOnSpecificAnchors");
    settings.Add("anchor71", false, "Cryosleep", "splitOnSpecificAnchors");
    settings.Add("anchor45", false, "Padbuilder", "splitOnSpecificAnchors");
    settings.Add("anchor46", false, "Height Jigsaw", "splitOnSpecificAnchors");
    settings.Add("anchor47", false, "Dice", "splitOnSpecificAnchors");
    settings.Add("anchor48", false, "Multi Requisites", "splitOnSpecificAnchors");
    settings.Add("anchor49", false, "Glitch", "splitOnSpecificAnchors");
    settings.Add("anchor50", false, "Hueshift", "splitOnSpecificAnchors");
    settings.Add("anchor51", false, "Repeater", "splitOnSpecificAnchors");
    settings.Add("anchor52", false, "Requisite Pads", "splitOnSpecificAnchors");
    settings.Add("anchor53", false, "Pair Jigsaw", "splitOnSpecificAnchors");
    settings.Add("anchor54", false, "Riser", "splitOnSpecificAnchors");
    settings.Add("anchor55", false, "Pair Archway", "splitOnSpecificAnchors");
    settings.Add("anchor56", false, "Angles", "splitOnSpecificAnchors");
    settings.Add("anchor57", false, "Binary Pairs", "splitOnSpecificAnchors");
    settings.Add("anchor58", false, "Toggle", "splitOnSpecificAnchors");
    settings.Add("anchor59", false, "Coloured Screens", "splitOnSpecificAnchors");
    settings.Add("anchor60", false, "Binary Archway", "splitOnSpecificAnchors");
    settings.Add("anchor61", false, "Requisite Pairs", "splitOnSpecificAnchors");
    settings.Add("anchor62", false, "Broken Requisites", "splitOnSpecificAnchors");
    settings.Add("anchor63", false, "Constellation Wrapping", "splitOnSpecificAnchors");
    settings.Add("anchor64", false, "Balance Pairs", "splitOnSpecificAnchors");
    settings.Add("anchor65", false, "Colour Wrapping", "splitOnSpecificAnchors");
    settings.Add("anchor66", false, "The Impossible Puzzle", "splitOnSpecificAnchors");
}

start {
    
}

split {    
    if (settings["splitOnSpecificAnchors"]
        && !settings["anchor"+current.currentAnchor]) {
        return false;
    }

    if (settings["splitOnlyUnsolved"]) {
        if (current.nrOfCompletedPuzzlesInAnchor == old.nrOfCompletedPuzzlesInAnchor + 1) {
            if (settings["splitOnPuzzleComplete"]) {
                return true;
            } else if (settings["splitOnAnchorComplete"]
                && current.nrOfCompletedPuzzlesInAnchor == current.nrOfPuzzlesInAnchor) {
                return true;
            }
        }
    } else {
        if (settings["splitOnPuzzleComplete"]
            && current.currentPuzzleInAnchor == old.currentPuzzleInAnchor + 1) {
            return true;
        } else if (settings["splitOnAnchorComplete"]
            && current.currentPuzzleInAnchor != 0
            && current.currentPuzzleInAnchor != old.currentPuzzleInAnchor 
            && current.currentPuzzleInAnchor == current.nrOfPuzzlesInAnchor) {
            return true;
        }
    }
}

reset {
    
}

isLoading {
    if (current.loadingBig == 1) {
        return true;
    } else if (current.loadingLevel != 0 && current.nrOfBots != 0) {
        return true;
    } else {
        return false;
    }
}
