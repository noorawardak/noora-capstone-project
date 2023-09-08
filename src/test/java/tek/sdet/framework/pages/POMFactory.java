package tek.sdet.framework.pages;

import tek.sdet.framework.base.BaseSetup;

public class POMFactory extends BaseSetup {
    private RetailSignInPage homePage;

    public POMFactory() {
        this.homePage = new RetailSignInPage();

    }

    public RetailSignInPage homePage() {
        return this.homePage;
    }

}