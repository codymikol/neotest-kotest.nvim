local M = {}

-- These are treesitter queries for pulling data of of the AST,
-- More information on how this works over here: https://neovim.io/doc/user/treesitter.html
-- And you can interactively play around with these kotlin queries here: https://fwcd.dev/tree-sitter-kotlin/

M.value = [[

;; --- DESCRIBE SPEC ---

; Matches namespace describe("context") { /** body **/ }

(call_expression
	(call_expression
	  (simple_identifier) @func_name (#eq? @func_name "describe")
      (call_suffix
        (value_arguments
          (value_argument
            (string_literal) @namespace.name
          )
        )
      )
    )
) @namespace.definition

; Matches test it("context") { /** body **/ }

(call_expression
	(call_expression
	  (simple_identifier) @func_name (#eq? @func_name "it")
      (call_suffix
        (value_arguments
          (value_argument
            (string_literal) @test.name
          )
        )
      )
    )
) @test.definition

; Mathes xdescribe("context") { /** body **/ }

(call_expression
	(call_expression
	  (simple_identifier) @func_name (#eq? @func_name "xdescribe")
      (call_suffix
        (value_arguments
          (value_argument
            (string_literal) @namespace.name
          )
        )
      )
    )
) @namespace.definition

; Mathes xit("context") { /** body **/ }

(call_expression
	(call_expression
	  (simple_identifier) @func_name (#eq? @func_name "xit")
      (call_suffix
        (value_arguments
          (value_argument
            (string_literal) @test.name
          )
        )
      )
    )
) @test.definition

;; -- todo FUN SPEC --
;; -- todo SHOULD SPEC --
;; -- todo STRING SPEC --
;; -- todo BEHAVIOR SPEC --
;; -- todo FREE SPEC --
;; -- todo WORD SPEC --
;; -- todo FEATURE SPEC --
;; -- todo EXPECT SPEC --
;; -- todo ANNOTATION SPEC --

]]

return M
