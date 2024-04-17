@ParameterizedTest(name = "arcsin({0})")
@DisplayName("TestTask1")
@ValueSource(doubles = {-2 * PI, -PI, -0.5 * PI, 0, 0.5 * PI, PI, 1.5 * PI, 2 * PI})
void checkPoints(double param) {
    assertAll(
            () -> assertEquals(Math.asin(param), Arcsin.calculate(param,  15), 0.001)
    );
}