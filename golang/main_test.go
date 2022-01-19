package main

import (
  "testing"
)

func TestExample(t *testing.T) {
  t.Run("A passing test", func(t *testing.T) {
    //Arrange
    value := 1

    //Act
    result := value == 1

    //Assert
    if result != true {
      t.Errorf("Maths is broken! Returned %v", result)
    }
  })
  t.Run("A failing test", func(t *testing.T) {
    t.Errorf("This test fails")
  })
}
