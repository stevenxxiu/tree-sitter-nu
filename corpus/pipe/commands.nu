=====
cmd-001-head
=====

cmd

-----

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)))))

======
cmd-002-head-sub
======

cmd sub

------

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string)))))

=====
cmd-003-external-cmd
=====

^cmd 42

-----

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_number)))))

=====
cmd-004-command-in-different-line
=====

print this
print this
print this
if $a == true {
    print this
    print this
}

-----

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (pipeline
    (pipe_element
      (ctrl_if
        (expr_binary
          (val_variable
            (identifier))
          (val_bool))
        (block
          (pipeline
            (pipe_element
              (command
                (cmd_identifier)
                (val_string))))
          (pipeline
            (pipe_element
              (command
                (cmd_identifier)
                (val_string)))))))))

=====
cmd-005-command-with-semicolon
=====

print $a; print $b; echo $c | print $in

-----

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_variable
          (identifier)))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_variable
          (identifier)))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_variable
          (identifier))))
    (pipe_element
      (command
        (cmd_identifier)
        (val_variable)))))

=====
cmd-006-so-many-arguments
=====

foo this is only for testing

-----

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string)
        (val_string)
        (val_string)
        (val_string)
        (val_string)))))

====
cmd-007-if-oneline
====

if $a { 0 } else { ls | print; ls | print; }

-----

(nu_script
  (pipeline
    (pipe_element
      (ctrl_if
        (val_variable
          (identifier))
        (block
          (pipeline
            (pipe_element
              (val_number))))
        (block
          (pipeline
            (pipe_element
              (command
                (cmd_identifier)))
            (pipe_element
              (command
                (cmd_identifier))))
          (pipeline
            (pipe_element
              (command
                (cmd_identifier)))
            (pipe_element
              (command
                (cmd_identifier)))))))))

=====
cmd-008-unquoted-1-character
=====

echo n

-----

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string)))))

=====
cmd-009-terminated-by-newline
=====

echo hello
let x = 42

-----

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (stmt_let
    (identifier)
    (pipeline
      (pipe_element
        (val_number)))))

======
cmd-010-long-flag
======

cmd --long-flag

------

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (long_flag)))))

======
cmd-011-path-string-1-dot
======

cargo install --path .
cargo install --path ./
cargo install --path ./dir

------

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string)
        (long_flag)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string)
        (long_flag)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string)
        (long_flag)
        (val_string))))
  )

======
cmd-012-path-string-2-dots
======

cd ..
cd ../
cd ../dir

------

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  )

======
cmd-013-path-string-3-dots
======

cd ...
cd .../
cd .../dir

------

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  )

======
cmd-014-path-string-4-dots
======

cd ....
cd ..../
cd ..../dir

------

(nu_script
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  (pipeline
    (pipe_element
      (command
        (cmd_identifier)
        (val_string))))
  )
