@Test
@DisplayName("Check zero-values")
void checkZeroValues(){
    assertAll(
            () -> assertArrayEquals(new int[]{0,0,0}, MergeSort.sort(new int[]{0,0,0}, 0, 2) )
    );
}