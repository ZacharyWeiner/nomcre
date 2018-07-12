require 'test_helper'

class PageSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_section = page_sections(:one)
  end

  test "should get index" do
    get page_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_page_section_url
    assert_response :success
  end

  test "should create page_section" do
    assert_difference('PageSection.count') do
      post page_sections_url, params: { page_section: { content: @page_section.content, order: @page_section.order, page_id: @page_section.page_id, title: @page_section.title } }
    end

    assert_redirected_to page_section_url(PageSection.last)
  end

  test "should show page_section" do
    get page_section_url(@page_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_section_url(@page_section)
    assert_response :success
  end

  test "should update page_section" do
    patch page_section_url(@page_section), params: { page_section: { content: @page_section.content, order: @page_section.order, page_id: @page_section.page_id, title: @page_section.title } }
    assert_redirected_to page_section_url(@page_section)
  end

  test "should destroy page_section" do
    assert_difference('PageSection.count', -1) do
      delete page_section_url(@page_section)
    end

    assert_redirected_to page_sections_url
  end
end
