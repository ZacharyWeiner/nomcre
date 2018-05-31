require 'test_helper'

class LeadNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lead_note = lead_notes(:one)
  end

  test "should get index" do
    get lead_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_lead_note_url
    assert_response :success
  end

  test "should create lead_note" do
    assert_difference('LeadNote.count') do
      post lead_notes_url, params: { lead_note: { lead_id: @lead_note.lead_id, note: @lead_note.note } }
    end

    assert_redirected_to lead_note_url(LeadNote.last)
  end

  test "should show lead_note" do
    get lead_note_url(@lead_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_lead_note_url(@lead_note)
    assert_response :success
  end

  test "should update lead_note" do
    patch lead_note_url(@lead_note), params: { lead_note: { lead_id: @lead_note.lead_id, note: @lead_note.note } }
    assert_redirected_to lead_note_url(@lead_note)
  end

  test "should destroy lead_note" do
    assert_difference('LeadNote.count', -1) do
      delete lead_note_url(@lead_note)
    end

    assert_redirected_to lead_notes_url
  end
end
