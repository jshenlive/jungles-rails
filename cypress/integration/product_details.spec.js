describe('Product Details', () => {

  // it('displays home page', () => {
  //   cy.visit('http://localhost:3000/')
  // })
  
  beforeEach(() => {
  
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3030/')
  })
  
  
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("Click first product directs to product page 2", () => {
    cy.get(".products article").first().click();
    cy.location('pathname').should('eq','/products/2')
  });

  it("Click second product directs to product page 1", () => {
    cy.get(".products article").eq(1).click();
    cy.location('pathname').should('eq','/products/1')
  });
  
  
  })