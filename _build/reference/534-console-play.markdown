# PLAY

> PLAY string

Play musical notes, a mp3 or ogg sound file. The music string is composed of the following building blocks:

| String               | Description                               
| :-------------------:|:------------------------------------------
| A-G[-|+|#][nnn][.]   | Play note A..G, +|# is sharp, - is flat, . is multiplier 1.5
| On                   | Octave n = 0..6,  n = < moves down one octave, n = > moves up one octave
| Nn                   | Play note n = 0..84 (0 = pause)
| Pn                   | Pause n = 1..64
| Ln                   | Length of note n = 1..64 (1/nnn)
| Tn                   | Tempo n = 32..255. Number of 1/4 notes per minute.
| MS                   | Staccato (1/2)
| MN                   | Normal (3/4)
| ML                   | Legato
| Vn                   | Volume n = 0..100
| MF                   | Play on foreground
| MB                   | Play on background
| Q                    | Clear sound queue

To play a sound file use `file://filename` as string. When playing on background, program execution continuous. If the end of the program is reach, the playback will stop.

### Example 1: Play a note

```
play "L2A"    ' note A with length 1/2
```

### Example 2: Play multiple notes

```
' Set volume to 50%
play "V10"  
' Play Menuet by J. Sebastian Bach
play "T180L8O3MN O4D4O3MLGABO4C O4D4O3MNG4MLG4 O4MNE4MLCDEF# O4G4O3MNG4MLG4 O4MNC4MLDCO3BA O3MNB4MLO4CO3BAG O3MNA4MLBAGF# G2.MN"
```

### Example 3: Play notes on background

```
play "MBL2A"    ' note A with length 1/2 on background
pause           ' make sure, that program will not end
```

### Example 4: Play a sound file

```
' Copy a mp3 file to the working directory and name it test.mp3

play "file://test.mp3"
pause                    ' make sure, that program will not end
```

