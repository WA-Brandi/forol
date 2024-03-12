{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
      {block name='product_thumbnail'}
        {if $product.cover}
          <a href="{$product.canonical_url}" class="thumbnail product-thumbnail">
            <img
              src="{$product.cover.bySize.home_default.url}"
              alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
              data-full-size-image-url="{$product.cover.large.url}"
            />
          </a>
        {else}
          <a href="{$product.canonical_url}" class="thumbnail product-thumbnail">
            <img src="{$urls.no_picture_image.bySize.home_default.url}" />
          </a>
        {/if}
      {/block}

      <div class="product-description">
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <h3 class="h3 product-title" itemprop="name"><a href="{$product.canonical_url}">{$product.name|truncate:70:'...'}</a></h3>
          {else}
            <h2 class="h3 product-title" itemprop="name"><a href="{$product.canonical_url}">{$product.name|truncate:70:'...'}</a></h2>
          {/if}
        {/block}

        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping">

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

              <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
              <span itemprop="price" class="price">{$product.price}</span>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}

              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                <span class="regular-price">{$product.regular_price}</span>
                {if $product.discount_type === 'percentage'}
                  <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                {elseif $product.discount_type === 'amount'}
                  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                {/if}
              {/if}

            </div>
          {/if}
        {/block}

{*
        {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
        {/block}
*}

        <div class="coupon-wrapper">
          <div class="coupon-wrapper__inner">
          {* {assign var=prod_cart_rule value=new CartRule(44)} *}
            {* {$prod_cart_rule|print_r} *}
            {* {debug} *}
            {* {$this->context->cart->getCartRules()} *}
            <p class="mb-0 text-gray-dark"><span>PRICE</span> z kodem: TEST</p>
            <div class="coupon-wrapper__inner_row">
              <svg width="16" height="16" viewBox="0 0 16 16">     
                <path d="M9.36996 7.78987C8.86174 7.05472 8.15039 6.48354 7.32282 6.14611C6.49525 5.80869 5.58731 5.71965 4.70995 5.88987C3.83301 6.06652 3.02469 6.48976 2.37995 7.10987C1.90447 7.57084 1.53944 8.13341 1.31219 8.75545C1.08495 9.37749 1.00139 10.0429 1.06776 10.7018C1.13413 11.3607 1.34872 11.9961 1.69546 12.5603C2.04219 13.1245 2.51209 13.603 3.06995 13.9599C3.94576 14.5319 4.99007 14.7891 6.03135 14.6891C7.07263 14.5892 8.04895 14.1381 8.79995 13.4099C9.22306 13.0035 9.55982 12.516 9.79007 11.9765C10.0203 11.4369 10.1393 10.8565 10.14 10.2699C10.1386 9.38457 9.87027 8.52025 9.36996 7.78987ZM4.91995 13.5899C4.25208 13.4586 3.63697 13.1354 3.14996 12.6599C2.66599 12.1931 2.33516 11.5904 2.20123 10.9315C2.06731 10.2726 2.13661 9.58853 2.39996 8.96987C2.66094 8.3471 3.10351 7.81742 3.66996 7.44987C4.14637 7.13957 4.69085 6.94929 5.25684 6.8953C5.82283 6.84131 6.39347 6.92523 6.91995 7.13987C7.33673 7.30898 7.71699 7.55684 8.03996 7.86987C8.35862 8.18274 8.61131 8.55634 8.78307 8.96857C8.95484 9.3808 9.04219 9.8233 9.03995 10.2699C9.03976 10.9406 8.83766 11.5957 8.45995 12.1499C8.07635 12.7065 7.53724 13.1378 6.90996 13.3899C6.28005 13.6481 5.58865 13.7176 4.91995 13.5899Z"></path>
                <path d="M15.01 2.06014C14.6907 1.80702 14.3282 1.6139 13.94 1.49014C12.9362 1.18161 11.89 1.03312 10.84 1.05014C9.79181 1.03373 8.74799 1.18912 7.75001 1.51014C7.36328 1.63264 7.00109 1.82219 6.68001 2.07014C6.55438 2.16787 6.45168 2.29192 6.37912 2.43359C6.30656 2.57525 6.26591 2.73109 6.26001 2.89014C6.25513 2.91658 6.25513 2.9437 6.26001 2.97014V5.26014C6.25986 5.32323 6.27214 5.38574 6.29617 5.44408C6.32019 5.50242 6.35548 5.55545 6.40001 5.60014C6.46009 5.65716 6.53756 5.69237 6.62001 5.70014C6.69132 5.72452 6.76871 5.72452 6.84001 5.70014C6.9342 5.69943 7.02554 5.66781 7.10001 5.61014C7.15586 5.59303 7.20955 5.56955 7.26001 5.54014C7.2961 5.48591 7.31998 5.4245 7.33001 5.36014C7.34489 5.29768 7.34489 5.2326 7.33001 5.17014C7.32095 5.1086 7.29691 5.05022 7.26001 5.00014V4.10014C7.41001 4.17014 7.57001 4.24014 7.74001 4.30014C8.74934 4.61565 9.80267 4.76757 10.86 4.75014C11.9201 4.77033 12.9766 4.62181 13.99 4.31014C14.16 4.25014 14.32 4.19014 14.47 4.12014V4.97014C14.4773 4.99632 14.4773 5.02397 14.47 5.05014C14.4108 5.11631 14.3395 5.17061 14.26 5.21014C14.0419 5.33543 13.8104 5.43605 13.57 5.51014C12.6928 5.76316 11.7829 5.88448 10.87 5.87014H10.74C10.0988 5.86687 9.45931 5.80325 8.83001 5.68014H8.73001C8.61737 5.68156 8.50836 5.72024 8.42001 5.79014C8.34526 5.84521 8.28937 5.92206 8.26001 6.01014C8.24308 6.07573 8.24308 6.14455 8.26001 6.21014C8.2516 6.26314 8.2516 6.31714 8.26001 6.37014C8.29531 6.42367 8.33924 6.47098 8.39001 6.51014C8.44551 6.54372 8.50641 6.56741 8.57001 6.58014C9.30929 6.73829 10.0641 6.81209 10.82 6.80014C11.8701 6.8185 12.9165 6.66999 13.92 6.36014C14.0948 6.3023 14.2652 6.23212 14.43 6.15014V7.01014C14.4373 7.03632 14.4373 7.06397 14.43 7.09014C14.3782 7.13658 14.3211 7.17685 14.26 7.21014C14.0419 7.33543 13.8104 7.43605 13.57 7.51014C12.6928 7.76316 11.7829 7.88448 10.87 7.87014H10.46C10.3345 7.87018 10.2135 7.91646 10.12 8.00014C10.0753 8.04473 10.0398 8.09772 10.0155 8.15607C9.99131 8.21441 9.97884 8.27697 9.97884 8.34014C9.97884 8.40332 9.99131 8.46587 10.0155 8.52421C10.0398 8.58256 10.0753 8.63555 10.12 8.68014C10.2135 8.76382 10.3345 8.81011 10.46 8.81014H10.84C11.9006 8.8271 12.9572 8.6752 13.97 8.36014C14.14 8.30014 14.3 8.23014 14.45 8.16014V9.01014C14.45 9.01014 14.45 9.01014 14.45 9.09014C14.3919 9.13792 14.3281 9.17824 14.26 9.21014C14.0419 9.33543 13.8104 9.43605 13.57 9.51014C12.6928 9.76316 11.7829 9.88448 10.87 9.87014C10.7445 9.87018 10.6235 9.91646 10.53 10.0001C10.4626 10.0673 10.4167 10.1529 10.3981 10.2462C10.3795 10.3394 10.389 10.4361 10.4254 10.524C10.4619 10.6118 10.5236 10.6869 10.6027 10.7396C10.6819 10.7923 10.7749 10.8204 10.87 10.8201C11.9311 10.8339 12.9877 10.6786 14 10.3601C14.17 10.3001 14.33 10.2301 14.48 10.1601V10.9901C14.4899 11.0193 14.4899 11.051 14.48 11.0801C14.4131 11.1335 14.339 11.1773 14.26 11.2101C14.044 11.3396 13.812 11.4404 13.57 11.5101C12.6939 11.7681 11.7832 11.8896 10.87 11.8701H10.41C10.2828 11.8709 10.1609 11.9211 10.07 12.0101C9.98159 12.0973 9.93125 12.216 9.93001 12.3401C9.92986 12.4032 9.94215 12.4657 9.96617 12.5241C9.99019 12.5824 10.0255 12.6355 10.07 12.6801C10.1609 12.7692 10.2828 12.8194 10.41 12.8201H10.86C11.91 12.8372 12.9562 12.6887 13.96 12.3801C14.3461 12.2587 14.7058 12.0653 15.02 11.8101C15.1487 11.7108 15.2534 11.5836 15.3261 11.4382C15.3988 11.2927 15.4378 11.1327 15.44 10.9701V2.97014C15.4457 2.94378 15.4457 2.91651 15.44 2.89014C15.433 2.72885 15.3909 2.57102 15.3166 2.42767C15.2424 2.28432 15.1377 2.15889 15.01 2.06014ZM14.46 2.91014C14.4641 2.92994 14.4641 2.95035 14.46 2.97014C14.4 3.02568 14.3327 3.07278 14.26 3.11014C14.0419 3.23543 13.8104 3.33605 13.57 3.41014C12.6928 3.66316 11.7829 3.78448 10.87 3.77014C9.95709 3.78553 9.04701 3.66418 8.17001 3.41014C7.93179 3.33871 7.70337 3.23794 7.49001 3.11014C7.42848 3.07357 7.37143 3.02994 7.32001 2.98014C7.31011 2.95096 7.31011 2.91932 7.32001 2.89014C7.31011 2.86096 7.31011 2.82932 7.32001 2.80014C7.36752 2.75009 7.4213 2.70639 7.48001 2.67014C7.68969 2.54207 7.91484 2.44125 8.15001 2.37014C9.01331 2.09946 9.91565 1.97442 10.82 2.00014H10.89C11.7902 1.98974 12.6868 2.11447 13.55 2.37014C13.7944 2.4421 14.0294 2.5428 14.25 2.67014C14.3122 2.70967 14.3693 2.75669 14.42 2.81014L14.46 2.91014Z"></path>
                <path d="M4.45005 8.21022H5.06005C5.09376 8.21256 5.12548 8.227 5.14938 8.25089C5.17327 8.27479 5.18772 8.30651 5.19005 8.34022V9.21022H5.26005C5.33099 8.89414 5.503 8.60978 5.75005 8.40022C5.99995 8.18988 6.31355 8.07008 6.64005 8.06022C6.75581 8.05792 6.87078 8.07986 6.97755 8.12464C7.08433 8.16941 7.18056 8.23604 7.26005 8.32022C7.34696 8.39959 7.4182 8.49457 7.47005 8.60022C7.51819 8.71053 7.54206 8.82989 7.54005 8.95022C7.54005 9.40022 7.29005 9.51022 7.02005 9.51022C6.75005 9.51022 6.53005 9.40022 6.53005 9.21022C6.53005 9.02022 6.67005 8.96022 6.67005 8.61022C6.67005 8.41022 6.55005 8.29022 6.30005 8.29022C5.87005 8.30022 5.26005 8.97022 5.26005 10.1202V12.4902C5.27172 12.5191 5.27172 12.5514 5.26005 12.5802C5.23076 12.5894 5.19934 12.5894 5.17005 12.5802H4.45005C4.41738 12.5897 4.38271 12.5897 4.35005 12.5802C4.34243 12.5507 4.34243 12.5197 4.35005 12.4902V8.34022C4.34084 8.31093 4.34084 8.27952 4.35005 8.25022C4.36289 8.2368 4.37846 8.22628 4.39571 8.21938C4.41296 8.21248 4.43149 8.20936 4.45005 8.21022Z"></path>
              </svg>
              <p class="mb-0 text-gray-dark">Tylko w ForolClub</p>
            </div>
          </div>
        </div>

      </div>

      <!-- @todo: use include file='catalog/_partials/product-flags.tpl'} -->
      {block name='product_flags'}
        <ul class="product-flags">
          {foreach from=$product.flags item=flag}
            <li class="product-flag {$flag.type}">{$flag.label}</li>
          {/foreach}
        </ul>
      {/block}

      <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
        {block name='quick_view'}
          <a class="quick-view" href="#" data-link-action="quickview">
            {l s='Quick view' d='Shop.Theme.Actions'}
          </a>
        {/block}

{*
        {block name='product_variants'}
          {if $product.main_variants}
            {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
          {/if}
        {/block}
*}
      </div>
    </div>
  </article>
{/block}
