require 'test_helper'

class ProposalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal = proposals(:one)
  end

  test "should get index" do
    get proposals_url
    assert_response :success
  end

  test "should get new" do
    get new_proposal_url
    assert_response :success
  end

  test "should create proposal" do
    assert_difference('Proposal.count') do
      post proposals_url, params: { proposal: { accepted: @proposal.accepted, background: @proposal.background, bts: @proposal.bts, charge_id: @proposal.charge_id, company_id: @proposal.company_id, completed: @proposal.completed, completed_on: @proposal.completed_on, content: @proposal.content, deadline: @proposal.deadline, deposit_id: @proposal.deposit_id, deposit_paid: @proposal.deposit_paid, deposit_paid_on: @proposal.deposit_paid_on, focus_points: @proposal.focus_points, location_id: @proposal.location_id, model_release: @proposal.model_release, paid: @proposal.paid, price: @proposal.price, proposal_type: @proposal.proposal_type, time_of_day: @proposal.time_of_day, title: @proposal.title, user_id: @proposal.user_id } }
    end

    assert_redirected_to proposal_url(Proposal.last)
  end

  test "should show proposal" do
    get proposal_url(@proposal)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposal_url(@proposal)
    assert_response :success
  end

  test "should update proposal" do
    patch proposal_url(@proposal), params: { proposal: { accepted: @proposal.accepted, background: @proposal.background, bts: @proposal.bts, charge_id: @proposal.charge_id, company_id: @proposal.company_id, completed: @proposal.completed, completed_on: @proposal.completed_on, content: @proposal.content, deadline: @proposal.deadline, deposit_id: @proposal.deposit_id, deposit_paid: @proposal.deposit_paid, deposit_paid_on: @proposal.deposit_paid_on, focus_points: @proposal.focus_points, location_id: @proposal.location_id, model_release: @proposal.model_release, paid: @proposal.paid, price: @proposal.price, proposal_type: @proposal.proposal_type, time_of_day: @proposal.time_of_day, title: @proposal.title, user_id: @proposal.user_id } }
    assert_redirected_to proposal_url(@proposal)
  end

  test "should destroy proposal" do
    assert_difference('Proposal.count', -1) do
      delete proposal_url(@proposal)
    end

    assert_redirected_to proposals_url
  end
end
