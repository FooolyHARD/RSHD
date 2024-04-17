@Test
@DisplayName("Check dead possible")
void checkDead() {
    Throwable exception = assertThrows(Exception.class, () -> someone.grow(250));
    assertEquals("Name dead...", exception.getMessage());
}