package rootball

type RecipeFile struct {
	Ingredients []*Ingredient
	Includes    []string
	includes    []*RecipeFile
	IsIncluded  bool
	ID          string
}

type Recipe struct {
	ID          string
	Ingredients []*Ingredient
}

type Ingredient struct {
	Dependencies []string
	dependencies []*Ingredient
	dependents   []*Ingredient
	isRequisite  bool
	ID           string
}

/*
import:
 - dira.recipeb
 - dirb.reciped
 - dirc.recipeb

manage-all-files:
 cmd.run:
  name: ls
  args:
   - -sl
  paht:  // this line is misspelled, but not ignored, instead causes a compilation failure
   - '/usr/bin/failure/'







*/
